//
//  ResponseCodableTests.swift
//  GBShopTests
//
//  Created by therealniks on 10.08.2021.
//

import XCTest
import Alamofire
@testable import GBShop

struct PostStub: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

enum ApiErrorAsub: Error {
    case fatalError
}

struct ErrorParserStub: AbstractErrorParser {
    func parse(_ result: Error) -> Error {
        return ApiErrorAsub.fatalError
    }
    
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error? {
        return error
    }
    
        
}

class ResponseCodableTests: XCTestCase {
    
    let expectation = XCTestExpectation(description: "Download https://failUrl")
    var errorParser: ErrorParserStub!

    override func setUp() {
        super.setUp()
        errorParser = ErrorParserStub()
    }
    override func tearDown() {
        super.tearDown()
        errorParser = nil
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testShouldDownloadAndParse() {
        AF.request("https://failUrl").responseCodable(errorParser: errorParser) {[weak self] (response: DataResponse<PostStub, AFError>) in
                switch response.result {
                case .success(_): break
                case .failure:
                    XCTFail()
                }
            self?.expectation.fulfill()
            }
        wait(for: [expectation], timeout: 10.0)
    }
}
