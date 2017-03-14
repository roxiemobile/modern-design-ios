# coding: utf-8
Pod::Spec.new do |s|

  s.name                  = 'ModernDesign'
  s.summary               = 'A collection of useful UI classes common to different iOS projects.'
  s.version               = '0.4.0'

  s.platform              = :ios
  s.ios.deployment_target = '8.0'

  s.authors               = { 'Alexander Bragin' => 'bragin-av@roxiemobile.com', 'Denis Kolyasev' => 'kolyasevda@ekassir.com' }

  s.license               = { type: 'BSD-4-Clause', file: 'LICENSE.txt' }

  s.homepage              = 'https://github.com/roxiemobile/modern-design.ios'

  s.source                = { git: 'https://github.com/roxiemobile/modern-design.ios.git', tag: s.version.to_s }
  s.source_files          = 'modules/modern-design/ModernDesign/**/*.{h,m,c,swift}'
  s.preserve_path         = 'LICENSE.txt'

  s.pod_target_xcconfig   = { 'ENABLE_BITCODE' => 'NO' }

  # External dependencies
  s.dependency 'SwiftCommons', '~> 0.7.2'
  s.dependency 'MBProgressHUD', '~> 0.9'
  s.dependency 'PureLayout', '~> 3.0'

end
