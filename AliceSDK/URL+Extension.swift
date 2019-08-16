//
//  URL+Extension.swift
//  AliceSDKExample
//
//  Created by lmcmz on 16/8/19.
//  Copyright © 2019 lmcmz. All rights reserved.
//

import Foundation

extension URL {
    
    func appending(_ queryItem: String, value: String?) -> URL {
        guard var urlComponents = URLComponents(string: absoluteString) else { return absoluteURL }
        var queryItems: [URLQueryItem] = urlComponents.queryItems ??  []
        let queryItem = URLQueryItem(name: queryItem, value: value)
        queryItems.append(queryItem)
        urlComponents.queryItems = queryItems
        return urlComponents.url!
    }
}
