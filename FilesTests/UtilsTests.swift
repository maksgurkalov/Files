//
//  UtilsTests.swift
//  FilesTests
//
//  Created by maks on 19.06.2022.
//

import XCTest
@testable import Files

class UtilsTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testValueByIndex() throws {
        let list: [String] = ["parentId", "childId", "isFolder", "name"]
        var value = Utils.getValueFromIndex(index: 0, from: list)
        XCTAssertEqual(value, "parentId")
        value = Utils.getValueFromIndex(index: 1, from: list)
        XCTAssertEqual(value, "childId")
        value = Utils.getValueFromIndex(index: 2, from: list)
        XCTAssertEqual(value, "isFolder")
        value = Utils.getValueFromIndex(index: 3, from: list)
        XCTAssertEqual(value, "name")
    }
    
    func testValueByUnavailableIndex() throws {
        let list: [String] = ["parentId", "childId", "isFolder"]
        let value = Utils.getValueFromIndex(index: 3, from: list)
        XCTAssertEqual(value, "")
    }
}
