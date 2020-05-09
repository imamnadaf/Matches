//
//  MatchesAPIRouter.swift
//  MatchesManager
//
//  Created by Nadaf, Imam on 09/05/20.
//  Copyright © 2020 Nadaf, Imam. All rights reserved.
//

import Foundation

enum MatchesAPIRouter: APIRouter {
    case getMatches(request: MatchRequest)
    
    var method: HTTPMethod {
        switch self {
        case .getMatches:
            return .get
        }
    }
    
    
    var endPoint: String {
        switch self {
        case .getMatches(let request):
            let baseEndPoint = EndPoint.matches.rawValue
            let params = JsonHelper.conovertParam(request)
            var urlComponents = URLComponents()
            urlComponents.queryItems = []
            for param in params {
                let value: String
                if param.value is Int {
                    value = String(param.value as! Int)
                } else {
                    value = param.value as! String
                }
                urlComponents.queryItems?.append(
                    URLQueryItem(
                        name: param.key,
                        value: value))
            }
            let queryString: String = urlComponents.string!
            return baseEndPoint + queryString
            
        }
    }
    
    var parameters: K.Parameters? {
        switch self {
        case .getMatches:
            return nil
        }
    }
}
