//
//  TestBool.swift
//  SwiftyJSON
//
//  Created by Shane Whitehead on 5/09/2016.
//
//

import XCTest
@testable import SwiftyJSON

class TestBool: XCTestCase {
    
    func testBool() {
        let value: [String: Any] = ["test": true, "anotherTest": false]
        let json = JSON(value)
        print(json)
        
        guard let text = json.rawString() else {
            XCTFail("Failed to convert JSON to String")
            return
        }
        guard let data = text.data(using: String.Encoding.utf8) else {
            XCTFail("Failed to convert String to Data")
            return
        }
        let body = JSON(data: data)
        
        let result = body["test"]
        let anotherResult = body["anotherTest"]
        
        XCTAssert(result.bool != nil, "result.bool did not return a expected Bool value")
        XCTAssert(anotherResult.bool != nil, "anotherResult.bool did not return a expected Bool value")
        
//        XCTAssert(result is Bool, "Did not get expected Bool result")
//        XCTAssert(anotherResult is Bool, "Did not get expected Bool result")
    }
    
}
