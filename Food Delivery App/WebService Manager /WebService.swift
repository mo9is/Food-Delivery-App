//
//  WebService.swift
//  Food Delivery App
//
//  Created by Monis Manzoor on 27/01/25.
//

import Combine
import SwiftUI

protocol WebServiceProtocol {
    func fetchData<T : Decodable>(fromURL urlRequest : URLRequest, type : T.Type) -> Future<T, Error>
}

final class WebService : WebServiceProtocol {
    var cancellables : Set<AnyCancellable> = []
    
    func fetchData<T : Decodable>(fromURL urlRequest : URLRequest, type : T.Type) -> Future<T, Error> {
        return Future<T, Error> { [weak self] promise in
            guard let self = self, let _ = urlRequest.url?.absoluteString else {
                promise(.failure(NetworkError.invalidURL))
                return
            }
            let configuration = URLSessionConfiguration.default
            configuration.timeoutIntervalForRequest = 30
            let session = URLSession(configuration: configuration)
            session.dataTaskPublisher(for: urlRequest.url!)
                .tryMap { (data, response) -> Data in
                    if (response as? HTTPURLResponse)?.statusCode != 200 {
                        throw NetworkError.invalidResponse
                    }
                    return data
                }
                .decode(type: T.self, decoder: JSONDecoder())
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: { completion in
                    if case .failure(let error) = completion {
                        switch error {
                        case let decodingError as DecodingError:
                            promise(.failure(decodingError))
                        case let apiError as NetworkError:
                            promise(.failure(apiError))
                        default :
                            promise(.failure(NetworkError.unknownError))
                        }
                    }
                }, receiveValue: { value  in
                    promise(.success(value))
                }).store(in: &cancellables)
        }
    }
}
                
