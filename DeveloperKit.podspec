#
# Be sure to run `pod lib lint DeveloperKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DeveloperKit'
  s.version          = '0.1.0'
  s.summary          = 'A short description of DeveloperKit.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/Swift-Developers/DeveloperKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'fanglinwei' => 'calm1993@163.com' }
  s.source           = { :git => 'https://github.com/Swift-Developers/DeveloperKit.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'DeveloperKit/Classes/**/*'
  
  # s.resource_bundles = {
  #   'DeveloperKit' => ['DeveloperKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.requires_arc = true

  s.frameworks = 'UIKit', 'Foundation'

  s.swift_version = '5.0'

  s.default_subspec = 'Plugins'

  s.dependency 'HyperioniOS/Core'
  
  s.subspec 'Plugins' do |sub|
      sub.source_files  = 'DeveloperKit/Classes/*.swift'
      sub.dependency ['Wormholy', 'GDPerformanceView-Swift']
  end

  # s.subspec 'Network' do |sub|
  #     sub.dependency ['Wormholy']
  #     sub.source_files  = 'Sources/Plugins/Network/*.swift'
  # end

  s.subspec 'Clean' do |sub|
      sub.source_files  = 'DeveloperKit/Classes/Clean/*.swift'
  end
end
