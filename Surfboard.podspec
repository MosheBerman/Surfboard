Pod::Spec.new do |s|

  s.name         = "Surfboard"
  s.version      = "1.0.0"
  s.summary      = "Surfboard is a delightful onboarding library for iOS."
  s.description  = <<-DESC
	Surfboard is a delightful onboarding library for iOS. Configure your onboarding experience with JSON.
                   DESC
  s.homepage     = "https://github.com/MosheBerman/Surfboard"
  s.screenshots  = "https://raw.github.com/MosheBerman/Surfboard/master/Screenshots/Intro.png", "https://raw.github.com/MosheBerman/Surfboard/master/Screenshots/Panels.png"
  s.author       = { "Moshe Berman" => "moshberm@gmail.com" }
  s.license 	 = 'MIT'
  s.platform     = :ios, '7.0'
  s.source       = { :git => "https://github.com/MosheBerman/Surfboard.git", :tag => "1.0.0"} 
  s.source_files  = 'Classes', 'Surfboard/SRFSurfboard/**/*.{h,m,xib}'
  s.requires_arc = true
end
