Pod::Spec.new do |s|

  s.name         = "KEmptyView"
  s.version      = "1.0.1"
  s.summary      = "Table & Collection Empty View"
  s.description  = <<-DESC
  iOS Customizable Table & Collection Empty reload view.
                   DESC
  s.homepage     = "https://github.com/KenanAtmaca/KEmptyView"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "KenanAtmaca" => "mail.kenanatmaca@gmail.com" }
  s.social_media_url   = "https://twitter.com/uikenan"

  s.platform     = :ios, "9.0"
  s.requires_arc = true
  s.ios.deployment_target = "9.0"

  s.source       = { :git => "https://github.com/KenanAtmaca/KEmptyView.git", :tag => "#{s.version}" }
  s.source_files  = "KEmptyView", "KEmptyView/**/*.{h,m,swift}"
  s.swift_version = '4.2'
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.2'}
end
