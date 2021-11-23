//
//  ProductsViewModel.swift
//  EndApp
//
//  Created by Dhiranjana Yadav on 23/11/21.
//

import Foundation

final class ProductsViewModel {
    
    private var productsService: EndProductService
    private var productList: [Product] = []
    
    public var productCellViewModels: [ProductsCellViewModel] = []
    
    init(productsService: EndProductService = EndNetworkRequestManager()) {
        self.productsService = productsService
    }
    
    func getProducts(success: (([ProductsCellViewModel]) -> Void)?, failure: ((Error) -> Void)?) {
        productsService.getProductList{ [weak self] result, error in
            if let error = error {
                failure?(error)
            } else if let result = result, let productList = result.products, let requiredSelf = self {
                requiredSelf.productList = productList
                var items = [ProductsCellViewModel]()
                for product in productList {
                    items.append(requiredSelf.createProductCellViewModel(product: product))
                }
                requiredSelf.productCellViewModels = items
                success?(items)
            }
        }
    }
    
    private func createProductCellViewModel(product: Product) -> ProductsCellViewModel {
        return ProductsCellViewModel(id: product.id, name: product.name, price: product.price, image: product.image)
    }
    
    func getProductCellViewModel(at indexPath: IndexPath) -> ProductsCellViewModel {
        return productCellViewModels[indexPath.row]
    }
    
    func getProduct(at indexPath: IndexPath) -> Product {
        return productList[indexPath.row]
    }



}
