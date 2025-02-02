//
//  HomeViewModel.swift
//  Food Delivery App
//
//  Created by Monis Manzoor on 27/01/25.
//

import Combine
import SwiftUI

enum LoadingState : Equatable {
    case inProgress
    case receivedError(message : String)
    case dataLoaded
}

extension String {
    static let requestTimeoutErrorMessage = "Request timed out"
    static let somethingWentWrong = "Something Went Wrong"
}

final class HomeViewModel : ObservableObject {
    let service : WebServiceProtocol
    var cancellable : Set<AnyCancellable> = []
    @Published var loadingState : LoadingState = .inProgress
    @Published var allDishes: AllDishes?

    init(service: WebServiceProtocol) {
        self.service = service
    }
    
    func fetchAllDishes() {
        self.service.fetchData(fromURL: URLRequest(url: URL(string:"https://yummie.glitch.me/dish-categories")!), type: APIResponse.self)
            .sink { [weak self] completion in
                switch completion {
                case .failure(let error):
                    if let error = error as? URLError,
                       error.code == .timedOut {
                        self?.loadingState = .receivedError(message: String.requestTimeoutErrorMessage)
                    } else {
                        self?.loadingState = .receivedError(message: String.somethingWentWrong)
                    }
                case .finished:
                    print("finished")
                }
            } receiveValue: { value in
                self.allDishes = value.data
                self.loadingState = .dataLoaded
            }
            .store(in: &cancellable)
    }
}
