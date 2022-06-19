//
//  ValueDataTests.swift
//  FilesTests
//
//  Created by maks on 19.06.2022.
//

import XCTest
@testable import Files

class ValueDataTests: XCTestCase {
    
    func testIsFolder() throws {
        let data: ValueData = ["parentId", "childId", "d", "name"]
        let isFolder = data.isFolder
        XCTAssertTrue(isFolder)
    }
    
    func testIsNotFolder() throws {
        let data: ValueData = ["parentId", "childId", "f", "name"]
        let isFolder = data.isFolder
        XCTAssertFalse(isFolder)
    }
    
    func testIsRoot() throws {
        let data: ValueData = ["parentId", "", "f", "name"]
        let isRoot = data.isRoot
        XCTAssertTrue(isRoot)
    }
}
