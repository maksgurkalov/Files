//
//  DataResponse.swift
//  Files
//
//  Created by maks on 08.06.2022.

import UIKit

struct DataResponse: Decodable {
    let range: String
    let majorDimension: String
    let values: [[String]]
}




