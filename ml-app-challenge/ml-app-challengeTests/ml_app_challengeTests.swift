//
//  ml_app_challengeTests.swift
//  ml-app-challengeTests
//
//  Created by Danica Weiler on 2021-10-28.
//

import XCTest
@testable import ml_app_challenge

class ml_app_challengeTests: XCTestCase {
    
    override func setUpWithError() throws {
        
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testAccountParseExample() throws {
        let data = """
        {
            "id": 1,
            "display_name": "Account",
            "account_number": "123456",
            "balance": 123.45
        }
        """
        
        let result = Account(id: 1, display_name: "Account", account_number: "123456", balance: 123.45)
        let usedata = Data(data.utf8)
        let res = try processData(usedata, model: Account.self)
        XCTAssertEqual(res as? Account, result)
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
