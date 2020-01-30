//
//  LydiaTestTests.swift
//  LydiaTestTests
//
//  Created by Bérangère La Touche on 26/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//

import XCTest
@testable import LydiaTest

class LydiaTestTests: XCTestCase {
    
    var sut: URLSession!

    override func setUp() {
        super.setUp()
        sut = URLSession(configuration: .default)
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    /// Test if the call api to Wather API return a 200 code
    func testValidCallToRandomUserApiGetsHTTPStatusCode200() {
        let url = URL(string: "https://randomuser.me/api/?results=10")

        let promise = expectation(description: "Status code: 200")

        let dataTask = sut.dataTask(with: url!) { data, response, error in
            
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
                return
            } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                if statusCode == 200 {
                    promise.fulfill()
                } else {
                    XCTFail("Status code: \(statusCode)")
                }
            }
        }
        dataTask.resume()

        wait(for: [promise], timeout: 5)
    }
    
    /// Test if the call to Weather API is complete
    func testCallToiRandomUserApiCompletes() {
        let url = URL(string: "https://randomuser.me/api/?results=10")
        let promise = expectation(description: "Completion handler invoked")
        var statusCode: Int?
        var responseError: Error?

        let dataTask = sut.dataTask(with: url!) { data, response, error in
            statusCode = (response as? HTTPURLResponse)?.statusCode
            responseError = error
            promise.fulfill()
            
        }
        dataTask.resume()
        wait(for: [promise], timeout: 5)

        XCTAssertNil(responseError)
        XCTAssertEqual(statusCode, 200)
    }
    
    /// Test the DateFormatterString extension
    func testDateFormatter() {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        let date = dateFormatterGet.date(from: "2019-11-05T15:56:59+0000")
        
        XCTAssertEqual(date!.toDateString(format: .hours), "16:56")
        XCTAssertEqual(date!.toDateString(format: .dateLetters), "05 Nov, 2019")
        XCTAssertEqual(date!.toDateString(format: .dateNumbers), "05-11-2019")
        XCTAssertNotEqual(date!.toDateString(format: .hours), "16:00")
        XCTAssertNotEqual(date!.toDateString(format: .dateLetters), "Jan 11, 2020")
        XCTAssertNotEqual(date!.toDateString(format: .dateNumbers), "Jan 11, 2020")
    }

}
