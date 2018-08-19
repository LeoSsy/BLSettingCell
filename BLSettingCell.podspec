Pod::Spec.new do |s|
s.name         = "BLSettingCell" # 项目名称
s.version      = "1.0.9"        # 版本号 与 你仓库的 标签号 对应
s.license      = "MIT"          # 开源证书
s.summary      = "通用设置页面cell,可以灵活扩展，多种样式可配置" # 项目简介

s.homepage     = "https://github.com/LeoSsy" # 你的主页
s.source       = { :git => "https://github.com/LeoSsy/BLSettingCell.git", :tag => "#{s.version}" }#你的仓库地址，不能用SSH地址
s.source_files = "BLSettingCell/*.{h,m}" # 你代码的位置， BLSettingCell/*.{h,m} 表示 BLSettingCell 文件夹下所有的.h和.m文件
s.public_header_files = 'BLSettingCell/*.{h}'
s.resource     = 'BLSettingCell/BLSetting.bundle'
s.requires_arc = true # 是否启用ARC
s.platform     = :ios, "8.0" #平台及支持的最低版本
s.frameworks   = "UIKit", "Foundation" #支持的框架
s.dependency "Masonry"   #依赖关系，该项目所依赖的其他库
s.dependency "SDWebImage"   #依赖关系，该项目所依赖的其他库

# User
s.author             = { "BY" => "781739973@qq.com" } # 作者信息
s.social_media_url   = "https://github.com/LeoSsy" # 个人主页
end


