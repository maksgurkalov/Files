//
//  ValueData.swift
//  Files
//
//  Created by maks on 16.06.2022.
//

import Foundation
typealias ValueData = [String]

extension ValueData {
    
    var parentId: String {
        return Utils.getValueFromIndex(index: 0, from: self)
    }
    
    var childId: String {
        return Utils.getValueFromIndex(index: 1, from: self)
    }
    
    var isFolder: Bool {
        return Utils.getValueFromIndex(index: 2, from: self) == "d"
    }
    
    var name: String {
        return Utils.getValueFromIndex(index: 3, from: self)
    }
    
    var isRoot: Bool {
        return childId == ""
    }
}


