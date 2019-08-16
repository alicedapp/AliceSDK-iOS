//
//  ViewController.swift
//  AliceSDKExample
//
//  Created by lmcmz on 16/8/19.
//  Copyright © 2019 lmcmz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, AliceDelegate {
    
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var signMessageLabel: UILabel!
    @IBOutlet var signTxlabel: UILabel!
    @IBOutlet var sendTxLabel: UILabel!
    
    func didReceiveAliceResponse(response: AliceResponse) {
        switch response.method {
        case .getAddress:
            addressLabel.text = response.address
        case .signMessage:
            signMessageLabel.text = response.signedData
        case .sendTransaction:
            sendTxLabel.text = response.trasactionHash
        case .signTransaction:
            signTxlabel.text = response.signedData
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        AliceSDK.shared.delegate = self
    }

    @IBAction func getAddress() {
        AliceSDK.getAddress()
    }
    
    @IBAction func signMessage() {
        AliceSDK.signMessage(message: signMessageLabel.text!)
    }
    
    @IBAction func signTransaction() {
        AliceSDK.signTransaction(to: "0xA60f8a3E6586aA590a4AD9EE0F264A1473Bab7cB",
                                 value: "0x2386f26fc10000",
                                 data: "0x48656c6c6f000000000000000000000000000000000000000000000000000000")
    }
    
    @IBAction func sendTransaction() {
        AliceSDK.sendTransaction(to: "0xA60f8a3E6586aA590a4AD9EE0F264A1473Bab7cB",
                                 value: "0x2386f26fc10000")
    }
    
}

