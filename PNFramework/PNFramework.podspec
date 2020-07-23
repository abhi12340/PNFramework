
Pod::Spec.new do |spec|

  spec.name         = "PNFramework"
  spec.version      = "2.0.0"
  spec.summary      = "Apple Notification Framework using APNS."
  spec.description  = "Demo Project for the Apple Notification using APNS In IOS"
  spec.homepage     = "https://github.com/abhi12340/PNFramework"
  spec.license      = "MIT"
  spec.author       = { "Abhishek Kumar" => "abhishekkumarthakur786@gmail.com"}
  spec.platform     = :ios, "13.0"
  spec.source       = { :git => "https://github.com/abhi12340/PNFramework.git", :tag => "#{spec.version}" }
  spec.source_files  = "PNFramework/**/*.swift"
  spec.swift_version = "5.0"
end
