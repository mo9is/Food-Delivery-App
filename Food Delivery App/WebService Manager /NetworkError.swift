//
//  NetworkError.swift
//  Food Delivery App
//
//  Created by Monis Manzoor on 27/01/25.
//

enum NetworkError : Error {
    case invalidResponse
    case noInternet
    case invalidURL
    case decodingFailed
    case unknownError
}
