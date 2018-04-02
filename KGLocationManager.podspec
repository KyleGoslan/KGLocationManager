Pod::Spec.new do |s|

  s.name             = "KGLocationManager"
  s.version          = "0.1.2"
  s.summary          = "Singleton location manager class."
  s.description      = "Easy to use one location manager across multiple view controllers."

  s.homepage         = "https://github.com/KyleGoslan/KGLocationManager"
  s.license          = 'MIT'
  s.author           = { "KyleGoslan" => "kylegoslan@me.com" }
  s.source           = { :git => "https://github.com/KyleGoslan/KGLocationManager.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/KyleGoslan'
  s.platform         = :ios, '10.0'
  s.requires_arc     = true
  s.source_files     = 'KGLocationManager'

end
