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

  s.module_name      = 'DeveloperKit'
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

  s.ios.deployment_target = '11.0'

  s.source_files = 'DeveloperKit/Classes/**/*'

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.requires_arc = true

  s.frameworks = 'UIKit', 'Foundation'

  s.swift_version = '5.0'

  s.default_subspec = 'Plugins'

  s.dependency 'HyperioniOS/Core'
  
  s.subspec 'Plugins' do |sub|
       sub.dependency 'DeveloperKit/Core'
       sub.dependency 'DeveloperKit/Network'
       sub.dependency 'DeveloperKit/Environment'
       sub.dependency 'DeveloperKit/AppInfo'
       sub.dependency 'DeveloperKit/Performance'
  end
  
  s.subspec 'Core' do |sub|
       sub.source_files  = 'DeveloperKit/Classes/Core/*.swift'
  end

  s.subspec 'Network' do |sub|
      sub.source_files  = 'DeveloperKit/Classes/Network/*.swift'
      sub.dependency 'DeveloperKit/Core'
      sub.dependency 'Wormholy'
      sub.resource_bundles = {'DeveloperKit' => ['DeveloperKit/Classes/Network/*.png']}
  end

  s.subspec 'Clean' do |sub|
      sub.source_files  = 'DeveloperKit/Classes/Clean/*.swift'
      sub.dependency 'DeveloperKit/Core'
      sub.resource_bundles = {'DeveloperKit' => ['DeveloperKit/Classes/Clean/*.png']}
  end
  
  s.subspec 'Environment' do |sub|
      sub.source_files  = 'DeveloperKit/Classes/Environment/*.swift'
      sub.dependency 'DeveloperKit/Core'
      sub.resource_bundles = {'DeveloperKit' => ['DeveloperKit/Classes/Environment/*.png']}
  end
  
  s.subspec 'AppInfo' do |sub|
      sub.source_files  = 'DeveloperKit/Classes/AppInfo/*.swift'
      sub.dependency 'DeveloperKit/Core'
      sub.resource_bundles = {'DeveloperKit' => ['DeveloperKit/Classes/AppInfo/*.png']}
  end
  
  s.subspec 'Performance' do |sub|
      sub.source_files  = 'DeveloperKit/Classes/Performance/*.swift'
      sub.dependency 'GDPerformanceView-Swift'
      sub.dependency 'DeveloperKit/Core'
#      sub.resources = ['DeveloperKit/Classes/Performance/*.png']
      sub.resource_bundles = {'DeveloperKit' => ['DeveloperKit/Classes/Performance/*.png']}
  end
  
end
