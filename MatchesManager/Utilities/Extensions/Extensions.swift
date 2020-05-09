//
//  Extensions.swift
//  MatchesManager
//
//  Created by Nadaf, Imam on 09/05/20.
//  Copyright © 2020 Nadaf, Imam. All rights reserved.
//

import Foundation

extension String {
    public func asURL() -> URL {
        guard let url = URL(string: self) else { fatalError("Unable to convert URL")}
        return url
    }
}

extension Data {
    var prettyPrintedJSONString: NSString { /// NSString gives us a nice sanitized debugDescription
           guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
               let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
               let prettyPrintedString = NSString(data: data,
                                                  encoding: String.Encoding.utf8.rawValue) else { return "" }
           
           return prettyPrintedString
       }
}
