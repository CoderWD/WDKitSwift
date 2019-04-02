#
#  Be sure to run `pod spec lint WDKit-Swift.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "WDKitSwift"
  s.version      = "1.0.2"
  s.summary      = "A short description of WDKit-Swift."
  s.description  = <<-DESC
                    It is a marquee view used on iOS, which implement by Objective-C.
                   DESC
  s.homepage     = "https://github.com/CoderWD/WDKitSwift"
  s.license      = "MIT"
  s.author             = { "何伟东" => "654500619@qq.com" }
  s.ios.deployment_target = "8.0"
  s.swift_version = '4.2'
  s.source       = { :git => "https://github.com/CoderWD/WDKitSwift.git", :tag => "#{s.version}" }
  s.source_files  = "Classes", "WDKitSwift/Class/*.{swift}"
  #s.exclude_files = "Classes/Exclude"
  #s.public_header_files = "WDKitSwift/Class/*.swift"

end
