#
# Be sure to run `pod lib lint DeveloperKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DeveloperKit'
  s.version          = '0.1.3'
  s.summary          = '基于HyperioniOS组件封装'

  s.module_name      = 'DeveloperKit'
# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

#  s.description      = <<-DESC
#TODO: Add long description of the pod here.
#                       DESC

  s.homepage         = 'https://github.com/Swift-Developers/DeveloperKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'fun' => 'lw_fun@163.com' }
  s.source           = { :git => 'https://github.com/Swift-Developers/DeveloperKit.git', :tag => s.version }

  s.ios.deployment_target = '11.0'

#  s.source_files = 'DeveloperKit/Classes/**/*'

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.requires_arc = true

  s.frameworks = 'UIKit', 'Foundation'

  s.swift_version = '5.0'

  s.default_subspecs = 'Core', 'Network', 'Clean', 'Environment', 'AppInfo', 'Performance'

  s.subspec 'Core' do |sub|
       sub.source_files  = 'DeveloperKit/Classes/Core/*.swift'
       sub.dependency 'HyperioniOS/Core'
  end

  s.subspec 'Network' do |sub|
      sub.source_files  = 'DeveloperKit/Classes/Network/*.swift'
      sub.dependency 'DeveloperKit/Core'
      sub.dependency 'Wormholy'
      sub.resources = ['DeveloperKit/Classes/Network/Resources/*.png']
  end

  s.subspec 'Clean' do |sub|
      sub.source_files  = 'DeveloperKit/Classes/Clean/*.swift'
      sub.dependency 'DeveloperKit/Core'
      sub.resources = ['DeveloperKit/Classes/Clean/Resources/*.png']
  end
  
  s.subspec 'Environment' do |sub|
      sub.source_files  = 'DeveloperKit/Classes/Environment/*.swift'
      sub.dependency 'DeveloperKit/Core'
      sub.resources = ['DeveloperKit/Classes/Environment/Resources/*.png']
  end
  
  s.subspec 'AppInfo' do |sub|
      sub.source_files  = 'DeveloperKit/Classes/AppInfo/*.swift'
      sub.dependency 'DeveloperKit/Core'
      sub.resources = ['DeveloperKit/Classes/AppInfo/Resources/*.png']
  end
  
  s.subspec 'Performance' do |sub|
      sub.source_files  = 'DeveloperKit/Classes/Performance/*.swift'
      sub.dependency 'GDPerformanceView-Swift'
      sub.dependency 'DeveloperKit/Core'
      sub.resources = ['DeveloperKit/Classes/Performance/Resources/*.png']
  end
  
end
