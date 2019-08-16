//
//  AliceSDK.swift
//  AliceSDKExample
//
//  Created by lmcmz on 16/8/19.
//  Copyright © 2019 lmcmz. All rights reserved.
//

import Foundation
import UIKit

typealias AliceSuccessBlock = ((String) -> Void)
typealias AliceErrorBlock = ((Error) -> Void)?

enum AliceSDKMethod: String {
    case getAddress
    case sendTransaction
    case signTransaction
    case signMessage
//    case signMessage(message: String)
    
//    var : String {
//        switch self {
//        case .getAddress:
//            return "getAddress"
//        case .sendTransaction:
//            return "sendTransaction"
//        case .signTransaction:
//            return "signTransaction"
//        case .signMessage(_):
//            return "signMessage"
//        }
//    }
}

class AliceSDK {
    static let baseURL = "alice://"
    static let method = "method"
    
    static let shared = AliceSDK()
    var delegate: AliceDelegate?
    
    static func sendRequest(request: AliceSDKMethod) {
    }
    
    static func getAddress() {
        let baseURL = URL(string: AliceSDK.baseURL)!
        let url = baseURL
            .appending(AliceSDK.method, value: AliceSDKMethod.getAddress.rawValue)
            .appending("callback", value: AliceSDK.externalURLScheme()!)
        UIApplication.shared.open(url)
    }
    
    static func signMessage(message: String) {
        let baseURL = URL(string: AliceSDK.baseURL)!
        let url = baseURL
            .appending(AliceSDK.method, value: AliceSDKMethod.signMessage.rawValue)
            .appending("callback", value: AliceSDK.externalURLScheme()!)
            .appending("message", value: message)
        UIApplication.shared.open(url)
    }
    
    static func signTransaction(to: String, value: String, data: String, detailObject: Bool = false) {
        let baseURL = URL(string: AliceSDK.baseURL)!
        let url = baseURL
            .appending(AliceSDK.method, value: AliceSDKMethod.signTransaction.rawValue)
            .appending("callback", value: AliceSDK.externalURLScheme()!)
            .appending("to", value: to)
            .appending("value", value: value)
            .appending("data", value: data)
            .appending("detailObject", value: String(detailObject))
        UIApplication.shared.open(url)
    }
    
    static func sendTransaction(to: String, value: String) {
        let baseURL = URL(string: AliceSDK.baseURL)!
        let url = baseURL
            .appending(AliceSDK.method, value: AliceSDKMethod.sendTransaction.rawValue)
            .appending("callback", value: AliceSDK.externalURLScheme()!)
            .appending("to", value: to)
            .appending("value", value: value)
        UIApplication.shared.open(url)
    }
    
    static func externalURLScheme() -> String? {
        guard let urlTypes = Bundle.main.infoDictionary?["CFBundleURLTypes"] as? [AnyObject],
            let urlTypeDictionary = urlTypes.first as? [String: AnyObject],
            let urlSchemes = urlTypeDictionary["CFBundleURLSchemes"] as? [AnyObject],
            let externalURLScheme = urlSchemes.first as? String else { return nil }
        return externalURLScheme
    }
    
    static func handleURL(url: URL) -> Bool {
//        AliceSDK.shared.delegate = delegate
        var dict = [String: String]()
        let components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        if let queryItems = components.queryItems {
            let _ = queryItems.map { item in
                dict[item.name] = item.value!
            }
        }
        
        guard let method = dict["method"], let aliceMethod = AliceSDKMethod(rawValue: method) else {
            return false
        }
        
        var response = AliceResponse.init(method: aliceMethod, address: nil, network: nil, chainId: nil, signedData: nil, trasactionHash: nil)
        switch aliceMethod {
        case .signMessage, .signTransaction:
            guard let sign = dict["sign"] else {
                return false
            }
            response.signedData = sign
        case .getAddress:
            guard let address = dict["address"] else {
                return false
            }
            response.address = address
        case .sendTransaction:
            guard let txHash = dict["txHash"] else {
                return false
            }
            response.trasactionHash = txHash
        }
        
        AliceSDK.shared.delegate!.didReceiveAliceResponse(response: response)
        return true
    }
}
