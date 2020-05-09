//
//  APIRouter.swift
//  MatchesManager
//
//  Created by Nadaf, Imam on 09/05/20.
//  Copyright © 2020 Nadaf, Imam. All rights reserved.
//

import Foundation

protocol APIRouter {
    
    var method: HTTPMethod { get }
    var endPoint: String { get }
    var parameters: K.Parameters? { get }
    var baseUrl: String { get }
}

extension APIRouter {
    
    var baseUrl: String {
        return K.baseUrl
    }
    
    func asURLRequest() -> URLRequest {
        let fullURLString = self.baseUrl + endPoint
        let url = fullURLString.asURL()
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        if let params = parameters {
            let data = JsonHelper.data(withJsonObject: params)
            urlRequest.httpBody = data
        }
        
        debugPrint("Request : ", urlRequest.description)
        
         return urlRequest
        
    }
}
