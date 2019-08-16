#
#  Be sure to run `pod spec lint AliceSDK.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|
  spec.name         = "AliceSDK"
  spec.version      = "0.0.1"
  spec.summary      = "AliceSDK Support Ethereum Payment With Alice Wallet."
  spec.description  = "AliceSDK Support Ethereum Payment With Alice Wallet"
  spec.homepage     = "https://github.com/alicedapp/AliceSDK-iOS"
  spec.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  spec.author             = { "lmcmz" => "lmcmze@gmail.com" }

  spec.source       = { :git => "https://github.com/alicedapp/AliceSDK-iOS.git", :tag => "#{spec.version}" }
  # spec.source       = { :git => "https://github.com/alicedapp/AliceSDK-iOS.git", :branch => "master" }

  spec.ios.deployment_target = '10.0'
  spec.source_files  = "AliceSDK/*"
  spec.swift_version = '5.0'
end
