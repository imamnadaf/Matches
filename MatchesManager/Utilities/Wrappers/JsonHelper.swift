//
//  JsonHelper.swift
//  MatchesManager
//
//  Created by Nadaf, Imam on 09/05/20.
//  Copyright © 2020 Nadaf, Imam. All rights reserved.
//

import Foundation

class JsonHelper {
    
    class func decode<T: Decodable>(for: T.Type = T.self, with data: Data) -> T {
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        }  catch let DecodingError.dataCorrupted(context) {
            fatalError("Couldn't decode \(T.self):\n\(context)")
          
        } catch let DecodingError.keyNotFound(_, context) {
            fatalError("Couldn't decode \(T.self):\n\(context)")

        } catch let DecodingError.valueNotFound(_, context) {
            fatalError("Couldn't decode \(T.self):\n\(context)")

        } catch let DecodingError.typeMismatch(_, context) {
             fatalError("Couldn't decode \(T.self):\n\(context)")

        } catch {
             fatalError("Couldn't decode \(T.self):\n\(error)")
        }
    }
    
    class func conovertParam<T>(_ value: T) -> [String: Any] where T: Encodable {
        do {
            let data = try JSONEncoder().encode(value)
            let params = try JSONSerialization.jsonObject(with: data,
                                                          options: .allowFragments) as! [String: Any]
            return params
        } catch {
            fatalError("Couldn't encode \(T.self):\n\(error)")
        }
    }
    
    class func data(withJsonObject obj: Any) -> Data {
        do {
            let data = try JSONSerialization.data(withJSONObject: obj, options: [])
            return data
        } catch {
            fatalError("Couldn't encode")
        }
    }
    
    class func jsonObject(with data: Data) -> [String: Any] {
        do {
            let data = try JSONEncoder().encode(data)
            let params = try JSONSerialization.jsonObject(with: data,
                                                          options: .allowFragments) as! [String: Any]
            return params
        } catch {
            fatalError("Couldn't encode")
        }
    }
}
