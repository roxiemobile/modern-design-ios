# coding: utf-8
Pod::Spec.new do |s|

# MARK: - Description

  s.name                  = 'ModernDesignExtensions'
  s.summary               = 'A collection of useful type extensions used for iOS apps development.'
  s.version               = '1.6.1'

  s.platform              = :ios
  s.ios.deployment_target = '12.0'
  s.swift_version         = '5.5'

  s.cocoapods_version     = '>= 1.11.3'
  s.static_framework      = true

  s.homepage              = 'https://github.com/roxiemobile/modern-design.ios'
  s.authors               = { 'Roxie Mobile Ltd.' => 'sales@roxiemobile.com', 'Alexander Bragin' => 'bragin-av@roxiemobile.com' }
  s.license               = 'BSD-4-Clause'

# MARK: - Configuration

  s.source = {
    git: 'https://github.com/roxiemobile/modern-design.ios.git',
    tag: "v#{s.version}"
  }

  base_dir = 'Modules/RoxieMobile.ModernDesign/Sources/Extensions/'
  s.source_files = base_dir + '{Sources,Dependencies}/**/*.swift'

  s.pod_target_xcconfig = {
    'GCC_PREPROCESSOR_DEFINITIONS' => "$(inherited) MODERNDESIGN_FRAMEWORK_VERSION=@\\\"#{s.version}\\\""
  }

# MARK: - Dependencies

  s.dependency 'SwiftCommons/Lang', '~> 1.6.0'
end
