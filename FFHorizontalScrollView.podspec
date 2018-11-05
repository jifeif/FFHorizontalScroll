Pod::Spec.new do |s|
  s.name             = "FFHorizontalScrollView"
  s.version          = "0.0.6"
  s.summary          = "广告消息水平滚动"
  s.description      = <<-DESC
                       这是一个水平滚动的告知信息view，可以自定义文字的大小颜色，暂不支持点击事件。
                       DESC
  s.homepage         = "https://github.com/jifeif/FFHorizontalScroll"
  s.license          = 'MIT'
  s.author           = { "XXX" => "XXX@gmail.com" }
  s.source           = { :git => "https://github.com/jifeif/FFHorizontalScroll.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/NAME'

  s.platform     = :ios, '9.0'
  s.requires_arc = true

  s.source_files = "FFHorizontalScroll/FFHorizontalScrollView/Core/*.{h, a}", "FFHorizontalScroll/FFHorizontalScrollView/Resources/*.bundle" 
  # s.resource = "FFHorizontalScroll/*.png"
  s.frameworks = 'UIKit'

end
