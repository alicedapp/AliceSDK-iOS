![banner](https://github.com/alicedapp/AliceX/blob/master/src/AliceAssets/alice-banner.png)

# Introduction

Alice SDK on iOS supports other apps that want to access crypto payments and don't want to build an entire wallet to do so but rather use an SDK. The Alice SDK allows your app to comfirm payments and sign messages via the Alice app.

Currently, the AliceSDK supports the following methods.

- getAddress
- signMessage
- sendTransaction
- signTransaction

# Installation

- Use cocoapods

  ```
  pod 'AliceSDK'
  ```

- Manual import

  Download this repository and drag the AliceSDK folder into your project.



# How to use

1. Add `AliceSDK.handle(url: url)` under `func application(_ app: UIApplication, open url: URL,option)` in your ***AppDelegate.swift***

   ```swift
       func application(_ app: UIApplication, 
                        open url: URL, 
                        options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
           AliceSDK.handleURL(url: url)
           return true
       }
   ```

2. Create a class inherit `AliceDelegate`

   ```swift
   class somclass: AliceDelegate {
     func didReceiveAliceResponse(response: AliceResponse) {
           switch response.method {
           case .getAddress:
             // do somethimg
           case .signMessage:
             // do somethimg
           case .sendTransaction:
             // do somethimg
           case .signTransaction:
             // do somethimg
           }
     }
   }
   ```

3. Create an instance for this class, and use the delegate method

   ```swift
   init() {
   	AliceSDK.shared.delegate = self
   }
   ```



# API

The following is the API for the Alice SDK:

### GetAddress

##### Input:

```swift
AliceSDK.getAddress()
```

##### Output:

```swift
func didReceiveAliceResponse(response: AliceResponse) {
	let address = response.address
  // do something
}
```

### SignMessage

##### Input:

- **Messsage** is a normal string, not a data string.

```swift
AliceSDK.signMessage(message: "String") // Normal String, no data string
```

#####Output:

```swift
func didReceiveAliceResponse(response: AliceResponse) {
		let signedData = response.signedData
	  // do something
}
```

### SignTransaction

##### Input:

- **To**: Ethereum address string
- **Value**: [BigInt](https://github.com/attaswift/BigInt)
- **Data**: Data string in hex

```swift
 AliceSDK.signTransaction(to: "0xA60f8a3E6586aA590a4AD9EE0F264A1473Bab7cB",
                          value: "0x2386f26fc10000",
                          data: "0x48656c6c6f000000000000000000000000000000000000000000000000000000")
```

##### Output:

```swift
func didReceiveAliceResponse(response: AliceResponse) {
		let signedData = response.signedData
	  // do something
}
```



### SendTransaction

##### Input:

- **To**: Ethereum address string
- **Value**: [BigInt](https://github.com/attaswift/BigInt)

```swift
AliceSDK.sendTransaction(to: "0xA60f8a3E6586aA590a4AD9EE0F264A1473Bab7cB",
                         value: "0x2386f26fc10000")
```

##### Output:

```swift
func didReceiveAliceResponse(response: AliceResponse) {
		let trasactionHash = response.trasactionHash
	  // do something
}
```



# Error

`//TODO`



# FeedBack

The best way to submit feedback and report bugs is to open a GitHub issue.
Please be sure to include your operating system, device, version number, and
steps to reproduce reported bugs.
