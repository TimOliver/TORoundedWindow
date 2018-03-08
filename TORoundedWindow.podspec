Pod::Spec.new do |s|
  s.name     = 'TORoundedWindow'
  s.version  = '1.0.0'
  s.license  =  { :type => 'MIT', :file => 'LICENSE' }
  s.summary  = 'A UIWindow overlay that adds rounded corners to the borders of your iOS apps.'
  s.homepage = 'https://github.com/TimOliver/TORoundedWindow'
  s.author   = 'Tim Oliver'
  s.source   = { :git => 'https://github.com/TimOliver/TORoundedWindow.git', :tag => s.version }
  s.platform = :ios, '7.0'
  s.source_files = 'TORoundedWindow/**/*.{h,m}'
  s.requires_arc = true
end
