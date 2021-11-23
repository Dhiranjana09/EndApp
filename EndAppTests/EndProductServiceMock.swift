//
//  EndProductServiceMock.swift
//  EndAppTests
//
//  Created by Dhiranjana Yadav on 23/11/21.
//

import Foundation
@testable import EndApp

class EndProductServiceMock: EndProductService {
    public var error: Error?
    public var results: Results?
    
    func getProductList(completionHandler: @escaping (_ result: Results?, _ error: Error?) -> Void) {
        completionHandler(results, error)
    }
}
