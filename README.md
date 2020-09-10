
<h3> Carthage </h3>

![Carthage](https://github.com/Carthage/Carthage/raw/master/Logo/PNG/header.png)


```
cd Desktop/RPBannerView-Swift/
git clone https://github.com/dengfeng520/RPBannerView-Swift.git
git add ./
git commit -a -m "上传代码"
git push origin master
git ll // 查看上传记录
```

在Terminal中cd到工程文件，执行build命令，
```
cd Desktop/RPBannerView-Swift/
carthage build --no-skip-current
```
一般情况下第一次build可能会报错，目前不知道是什么原因造成的。
`Skipped building RPBannerView-Swift due to the error:
Dependency "RPBannerView-Swift" has no shared framework schemes`

解决报错方法：打开**Manage Schemes**，取消勾选**RPBannerView**,点击Close,然后再次打开重新勾选即可。
重新build成功。

`Building scheme "RPBannerView" in RPBannerView-Swift.xcodeproj`

上传代码

```
cd Desktop/RPBannerView-Swift/
git add ./
git commit -a -m "update code"
git push origin master
```

创建tag

```
cd Desktop/RPBannerView-Swift/
git tag 1.0
git push --tags
```


```
cd RPBannerViewDemo
touch Cartfile
Vim Cartfile
github "dengfeng520/RPBannerView-Swift"
Esc -> :wq
carthage update --platform iOS
```

```
/usr/local/bin/Carthage copy-frameworks
```
```
$(SRCROOT)/Carthage/Build/iOS/RPBannerView.framework
```
```
import RPBannerView

RPBanner.showBanner(BannerDisplay(title: "test loading..." ,backColor: UIColor.red, addView: view))
```

<h3> CocoaPods </h3>

```
cd Desktop/RPBannerView-Swift/
pod spec create RPBannerView-Swift
vim RPBannerView-Swift.podspec
```

```
Pod::Spec.new do |spec|
spec.name         = "RPBannerView-Swift"
spec.version      = "1.0"
spec.summary      = "A short description of RPBannerView."
spec.description  = "RPBannerView-Swift"
spec.homepage     = "https://github.com/dengfeng520/RPBannerView-Swift"
spec.license      = { :type => "MIT", :file => "LICENSE" }
spec.author             = { "dengfeng520" => "deng_feng520@163.com" }
spec.platform     = :ios
spec.ios.deployment_target = "11.0"
spec.source       = { :git => "https://github.com/dengfeng520/RPBannerView-Swift", :tag => "#{spec.version}" }
spec.source_files  = "RPBannerView-Swift/RPBannerView/*.swift"
spec.framework  = "Foundation", "UIKit"
end
```

```
pod spec lint RPBannerView-Swift.podspec --allow-warnings
```
```
RPBannerView-Swift.podspec passed validation. 
```
代表成功。

注册CocoaPods帐号，
```
pod trunk register deng_feng520@163.com 'dengfeng520' --description='dengfeng520'

```
查看CocoaPods帐号信息：
```pod trunk me
```
如果已经注册了，直接发布到CocoaPods服务器：

```
pod trunk push RPBannerView-Swift.podspec --allow-warnings
```

发布成功后更新CocoaPods本地库:

```
 pod setup
```
然后搜索

```
pod search RPBannerView-Swift
```

创建Podfile
```
pod init
vim Podfile
pod 'RPBannerView-Swift', :git => 'https://github.com/dengfeng520/RPBannerView-Swift'
pod install
```

```
Pod installation complete! There are 1 dependencies from the Podfile and 1 total pods installed.
```

