//
//  EndNetworkRequestManager.swift
//  EndApp
//
//  Created by Dhiranjana Yadav on 19/11/21.
//

import Foundation
import UIKit

protocol EndProductService {
    func getProductList(completionHandler: @escaping (_ result: Results?, _ error: Error?) -> Void)
}

class EndNetworkRequestManager: EndProductService {
    
    private let defaultSession = URLSession(configuration: .default)
    private var dataTask: URLSessionDataTask?
    let urlString = "https://www.endclothing.com/media/catalog/example.json"
    
    func getProductList(completionHandler: @escaping (_ result: Results?, _ error: Error?) -> Void) {
        dataTask?.cancel()
        guard let url = URL(string: urlString) else {
            return
        }
        
        dataTask = defaultSession.dataTask(with: url) { [weak self] data, response, networkError in
            defer {
                self?.dataTask = nil
            }
            
            if let networkError = networkError {
                completionHandler(nil, networkError)
            } else if
                let data = data,
                let response = response as? HTTPURLResponse,
                response.statusCode == 200 {
                let decoder = JSONDecoder()
                do {
                    let productsData = try decoder.decode(Results.self, from: data)
                    print(productsData)
                    completionHandler(productsData, nil)
                } catch {
                    completionHandler(nil, error)
                }
            }
        }
        
        dataTask?.resume()
    }
}
