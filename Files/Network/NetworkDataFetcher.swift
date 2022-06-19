//
//  NetworkDataFetcher.swift
//  Files
//
//  Created by maks on 09.06.2022.
//

import Foundation

class DataFetcher {
    
    let networkService = NetworkService()
    
    func fetchData(urlString: String, response: @escaping (DataResponse?) -> Void) {
        networkService.getData(urlString: urlString) { result in
            switch result {
                
            case .success(let data):
                do {
                    let value = try JSONDecoder().decode(DataResponse.self, from: data)
                    response(value)
                } catch let jsonError {
                    print("Failed while decoding JSON \(jsonError.localizedDescription)")
                    response(nil)
                }
            case .failure(let error):
                print("Error receiced data \(error.localizedDescription)")
                response(nil)
            }
        }
    }
}


