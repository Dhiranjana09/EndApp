//
//  MockNetworkError.swift
//  EndAppTests
//
//  Created by Dhiranjana Yadav on 23/11/21.
//

import Foundation

public class MockNetworkError: Error {
    public static let errorMessage: String = NSLocalizedString("Unauthorized", comment: "My error")
}

extension MockNetworkError: LocalizedError {
    public var errorDescription: String? {
        return MockNetworkError.errorMessage
    }
}
