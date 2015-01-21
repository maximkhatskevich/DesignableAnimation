Pod::Spec.new do |s|

  s.name         = "MKHDesignableAnimation"
  s.version      = "1.0.1"
  s.summary      = "Set of helpers that let you automate view animations through designing key view states using Interface Builder"
  s.homepage     = "https://github.com/maximkhatskevich/MKHDesignableAnimation"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author       = { "Maxim Khatskevich" => "maxim.khatskevich@gmail.com" }
  s.platform     = :ios, "6.0"

  s.source       = { :git => "https://github.com/maximkhatskevich/MKHDesignableAnimation.git", :tag => "#{s.version}" }

  s.requires_arc = true

  s.source_files  = "Main/Src/*.{h,m}"

end
