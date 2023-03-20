//
//  Error.swift
//  Radianite
//
//  Created by Alexis Beaudoin on 20/03/2023.
//

import Foundation

enum NetworkError: LocalizedError {
    case invalidError
    case badRequest
    case invalidResponse

    var errorDescription: String {
        switch self {
        case .invalidError:
            return "Invalid URL"
        case .badRequest:
            return "Request failed or no connection"
        case .invalidResponse:
            return "Failed to decode data"
        }
    }
}
