//
//  NetworkServiceManager.swift
//  MatchesManager
//
//  Created by Nadaf, Imam on 09/05/20.
//  Copyright © 2020 Nadaf, Imam. All rights reserved.
//

import Foundation

protocol NetworkServiceProtocol {
    func performRequest<T: Decodable>(for: T.Type,
                                      route: APIRouter,
                                      completion: @escaping (T?, Error?) -> Void)
}

class NetworkServiceManager: NetworkServiceProtocol {
    
    private let session =  URLSession(configuration: .default)
    
    func performRequest<T>(for: T.Type, route: APIRouter, completion: @escaping (T?, Error?) -> Void) where T : Decodable {
        
        session.dataTask(with: route.asURLRequest()) { (data, response, error) in
            guard let data = data, let response = response as? HTTPURLResponse,
                response.statusCode == 200 else {
                    print("No data or statusCode not OK")
                    completion(nil, error)
                    return
            }
            let dataInfo  = JsonHelper.decode(for: T.self, with: data)
            completion(dataInfo, nil)
        }.resume()
    }
}
