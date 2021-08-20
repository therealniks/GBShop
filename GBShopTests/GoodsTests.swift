//
//  GoodsTests.swift
//  GBShopTests
//
//  Created by therealniks on 19.08.2021.
//

import XCTest
import Alamofire
@testable import GBShop

class GoodsTests: XCTestCase {
    
    var requestFactory: RequestFactory!
    var goods: GoodsRequestFactory!
    var goodsCatalogue: GoodsRequestFactory!
    let expectation = XCTestExpectation(description: "Download timeout")

    override func setUpWithError() throws {
        requestFactory = RequestFactory()
        goods = requestFactory.makeGoodsRequestFactory()
        goodsCatalogue = goods
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCatalogue() throws {
        let page = 1
        let category = 1
        
        goodsCatalogue.getCatalog(page: page, category: category) { response in
            switch response.result {
            case .success(let catalogue):
                print("\(catalogue)")
            case .failure(let error):
                print(error.localizedDescription)
                XCTFail(error.localizedDescription)
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }

    func testOneProduct() throws {
        let goodsID = 123
        
        goods.getProduct(for: goodsID) { response in
            // then
            switch response.result {
            case .success(let product):
                print("\(product)")
            case .failure(let error):
                print(error.localizedDescription)
                XCTFail(error.localizedDescription)
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
