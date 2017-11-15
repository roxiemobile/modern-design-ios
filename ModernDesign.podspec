# coding: utf-8
Pod::Spec.new do |s|

# MARK: - Description

  s.name                  = 'ModernDesign'
  s.summary               = 'A collection of useful UI classes common to different iOS projects.'
  s.version               = '0.0.1'

  s.platform              = :ios
  s.ios.deployment_target = '8.0'
  s.static_framework      = true

  s.authors               = { 'Roxie Mobile Ltd.' => 'sales@roxiemobile.com', 'Alexander Bragin' => 'bragin-av@roxiemobile.com', 'Denis Kolyasev' => 'kolyasevda@ekassir.com' }
  s.license               = { type: 'BSD-4-Clause', file: 'LICENSE.txt' }

  s.homepage              = 'https://github.com/roxiemobile/modern-design.ios'

  s.source                = { git: 'https://github.com/roxiemobile/modern-design.ios.git', tag: "v#{s.version}" }
  s.preserve_path         = 'LICENSE.txt'

  s.pod_target_xcconfig   = { 'SWIFT_VERSION' => '4.0' }

  s.default_subspecs      = 'UI/Extensions'

# MARK: - Modules

  # TODO: Write a description
  s.subspec 'UI' do |sc|

    # TODO: Write a description
    sc.subspec 'Extensions' do |sp|
      src_path = 'Modules/RoxieMobile.ModernDesign/UI.Extensions'

      # Configuration
      sp.source_files  = "#{src_path}/Module/**/*.{swift,h,m,c,modulemap}"

      # Dependencies
      sp.dependency 'SwiftCommons/Core/Lang'
    end
  end
end
