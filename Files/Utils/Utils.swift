//
//  Utils.swift
//  Files
//
//  Created by maks on 19.06.2022.
//

import Foundation

class Utils {
    static func searchDataByFolderId(id: String, from list: [ValueData]?) -> [ValueData] {
        
        return list?.filter({ $0.childId == id }).sorted(by: { $0.isFolder && !$1.isFolder }) ?? []
    }
    
    static func getValueFromIndex(index: Int, from list: [String]) -> String {
        guard list.count > index else { return "" }
        
        return list[index]
    }
}
