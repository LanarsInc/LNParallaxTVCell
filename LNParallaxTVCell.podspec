Pod::Spec.new do |s|

  s.name                  = 'LNParallaxTVCell'
  s.version               = '1.0.0'
  s.summary               = 'UITableViewCell with parallax effect'
  s.homepage              = 'https://github.com/LanarsInc/LNParallaxTVCell'
  s.license               = { :type => 'BSD', :file => 'LICENSE' }
  s.author                = { 'Lanars' => 'https://github.com/LanarsInc' }
  s.source                = { :git => 'https://github.com/LanarsInc/LNParallaxTVCell.git', :tag => s.version.to_s }
  s.source_files          = 'LNParallaxTVCell/Classes/**/*'
  s.frameworks            = 'UIKit'
  s.ios.deployment_target = '10.0'
  s.swift_version         = '5.0'

end
