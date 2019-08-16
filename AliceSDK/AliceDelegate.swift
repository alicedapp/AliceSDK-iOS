//
//  AliceDelegate.swift
//  AliceSDKExample
//
//  Created by lmcmz on 16/8/19.
//  Copyright © 2019 lmcmz. All rights reserved.
//

import Foundation

struct AliceResponse {
    var method: AliceSDKMethod
    var address: String?
    var network: String?
    var chainId: String?
    var signedData: String?
    var trasactionHash: String?
}

protocol AliceDelegate {
    func didReceiveAliceResponse(response: AliceResponse)
}
