//
//  ProductsViewModelTests.swift
//  EndAppTests
//
//  Created by Dhiranjana Yadav on 23/11/21.
//

import XCTest
@testable import EndApp

class ProductsViewModelTests: XCTestCase {
    
    private var viewModel: ProductsViewModel?
    private var service: EndProductServiceMock?
    private var productCellVM: ProductsCellViewModel?
    let indexPath = IndexPath(row: 0, section: 0)
    var result: Results!
    
    override func setUpWithError() throws {
        let productService = EndProductServiceMock()
        viewModel = ProductsViewModel(productsService: productService)
        service = productService
        let jsonResultData = getTestData()
        let decoder = JSONDecoder()
        self.result = try decoder.decode(Results.self, from: jsonResultData)
    }
    
    private func getTestData() -> Data {
        let testBundle = Bundle(for: type(of: self))
        guard let pathString = testBundle.path(forResource: "Results", ofType: "json") else {
            fatalError("Results.json not found")
        }
        
        guard let jsonString = try? NSString(contentsOfFile: pathString, encoding: String.Encoding.utf8.rawValue) else {
            fatalError("Unable to Results.json.json to String")
        }
        
        print("The JSON string is: \(jsonString)")
        
        guard let jsonData = jsonString.data(using: String.Encoding.utf8.rawValue) else {
            fatalError("Unable to Results.json.json to NSData")
        }
        return jsonData
    }
    
    
    func testGetProductsWhenProducts() {
        // given
        service?.error = nil
        service?.results = self.result
        // when
        
        viewModel?.getProducts(success: { productsViewModels in
            XCTAssertEqual(productsViewModels.count, 4)
            let firstProductViewModel = productsViewModels[0]
            XCTAssertEqual(firstProductViewModel.name, self.result.products?[0].name)
        }, failure: { error in
            XCTFail()
        })
    }

    func testGetProductwithError(){
        // given
        let errorMsg: Error?
        service?.results = nil
        
        //when
        viewModel?.getProducts(success: {error in
            XCTFail()
        }, failure: { error in
            XCTAssertEqual(error.localizedDescription, "something went wrong")
        })
    }
   
    func testGetProductsWhenNoProducts() {
        // given
        service?.error = nil
        service?.results = nil
        // when
        
        viewModel?.getProducts(success: { productsViewModels in
            XCTAssertEqual(productsViewModels.count, 0)
        }, failure: { error in
            XCTFail()
        })
        
    }
    
   
        func testGetProduct(){
        
        }
    
    
    

  




}


