//
//  NetworkService.swift
//  Files
//
//  Created by maks on 08.06.2022.
//

import Foundation

public class NetworkService {
    
    func getData(urlString: String, completion: @escaping (Result<Data, Error>) -> Void) {
        var components = URLComponents(string: urlString)
        components?.queryItems = [URLQueryItem(name: "key", value: "AIzaSyD3UdScppqXDnA_fgfHuSCJDoDYT6Oo9-A")]
        guard let url = components?.url else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("error with reaponse data")
                    completion(.failure(error))
                    return
                }
                guard let data = data else { return }
                completion(.success(data))
        }.resume()
    }
}
