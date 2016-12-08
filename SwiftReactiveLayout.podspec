Pod::Spec.new do |s|
  s.name         = "SwiftReactiveLayout"
  s.version      = "0.0.1"
  s.summary      = "Swift implementation of some of the ideas behind ReactiveCocoaLayout."
  s.homepage     = "https://github.com/jconst/SwiftReactiveLayout"
  s.author       = { "SwiftReactiveLayout" => "SwiftReactiveLayout" }
  s.source       = { :git => "https://github.com/jconst/SwiftReactiveLayout.git", :tag => "#{s.version}" }
  s.license      = 'MIT'
  s.description  = "Swift implementation of some of the ideas behind ReactiveCocoaLayout."

  s.requires_arc = true
  s.ios.deployment_target = '8.0'

  s.source_files = 'SwiftReactiveLayout/*'
  s.dependency 'ReactiveSwift'
  s.ios.frameworks = 'Foundation', 'CoreGraphics', 'UIKit'
end
