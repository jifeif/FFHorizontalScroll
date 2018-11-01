Pod::Spec.new do |s|
  s.name             = "FFHorizontalScrollView"
  s.version          = "0.0.1"
  s.summary          = "随便写的东西"
  s.description      = <<-DESC
                       测试.
                       DESC
  s.homepage         = "https://github.com/Example/GofShakeAndEmail"
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { "XXX" => "XXX@gmail.com" }
  s.source           = { :git => "https://github.com/jifeif/FFHorizontalScroll.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/NAME'

  s.platform     = :ios, '9.0'
  s.requires_arc = true

  s.source_files = "FFHorizontalScroll/FFHorizontalScrollView/**/*"
  s.frameworks = 'UIKit'

end
