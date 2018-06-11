//
//  DIKitTestTests.swift
//  DIKitTestTests
//
//  Created by 史 翔新 on 2018/06/11.
//  Copyright © 2018年 YUMEMI. All rights reserved.
//

import XCTest
@testable import DIKitTest

class DIKitTestTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let exception = XCTestExpectation(description: "test")
        let viewModel = MockAppResolver.shared.resolveViewModel()
        DispatchQueue.global().async {
            for _ in 0 ..< 50 {
                print("test: \(viewModel.dateString)")
                Thread.sleep(forTimeInterval: 0.5)
            }
            exception.fulfill()
        }
        wait(for: [exception], timeout: 100)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
