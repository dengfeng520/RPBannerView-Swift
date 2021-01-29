![](https://img.shields.io/badge/language-swift-orange.svg)
![](https://img.shields.io/cocoapods/l/RPBannerView-Swift.svg?style=flat)
![](https://img.shields.io/cocoapods/p/RPBannerView-Swift.svg?style=flat)
![](https://img.shields.io/cocoapods/v/RPBannerView-Swift.svg?style=flat)
![](https://img.shields.io/badge/carthage-v1.0-519dd9.svg)


<h2 align="center">RPBannerView</h2>

**RPBannerView**是一个轻量级的Banner提示框。支持**iOS 11、Swift 5.0**之后的版本。推荐使用**CocoaPods**和**Carthage**将其添加到工程中。


![A16](https://p9-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/500920f90ca1485ca638e5db82af1771~tplv-k3u1fbpfcp-zoom-1.image)

![A17](https://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/f002b0aecf144ce6a9265c2a3aab5d50~tplv-k3u1fbpfcp-zoom-1.image)

<h3>Carthage</h3>

* 1、 导入工程 

```
cd yourProject
touch Cartfile
Vim Cartfile
github "dengfeng520/RPBannerView-Swift"
Esc -> :wq
carthage update --platform iOS
```

* 2、添加FrameWork

更新完成后,打开工程，选择TARGETS -->Build Phases--> Link Binary With Libries 点击加号，选择 Add File --> Carthage --> Build --> iOS 添加RPBannerView.FrameWork.

接下来，点击+，选择New Run Script Phase，此时新建了Run Script,在执行命令中添加:

```
/usr/local/bin/Carthage copy-frameworks
```

在Input Files中引入我们要用到的库的路径:

```
$(SRCROOT)/Carthage/Build/iOS/RPBannerView.framework
```

* 3、使用RPBannerView

在需要用到`RPBannerView`的类中引用即可使用：

```
import RPBannerView
```

```
// 显示 
RPBanner.showBanner(BannerDisplay(title: "test loading..." ,backColor: UIColor.red, addView: view ,time: 0, mode: .mobileMode))
// 隐藏
RPBanner.hiddenBanner()
```

自定义BannerView:

```
  var display = BannerDisplay()
  display.title = "this is test text.... this is test text.... this is test text...."
  display.showMode = .popMode
  display.addView = view
  display.showTime = 5
  display.top = 15
  display.backColor = UIColor(red: 245.0/255.0, green: 190.0/255.0, blue: 98.0/255.0, alpha: 1)
  display.titleColor = .white
  display.titleFontSize = 14.5
  RPBannerView.showBanner(display)
```

![自定义View](https://github.com/dengfeng520/RPBannerView-Swift/blob/master/A18.jpg?raw=true)

* 4、兼容OC版本

```
RPBannerView.show(with: .warningMode, body: "test test test test test", isView: self.view)
```

<h3>CocoaPods</h3>

```
cd yourProject
pod init
Vim Podfile
pod 'RPBannerView-Swift', :git => 'https://github.com/dengfeng520/RPBannerView-Swift'
Esc -> :wq
pod install
```

编译完成后在需要用到`RPBannerView`的类中引用即可使用：

```
// 显示 
RPBannerView.showBanner(BannerDisplay(title: "test loading..." ,backColor: UIColor.red, addView: view ,time: 0, mode: .mobileMode))
// 隐藏
RPBannerView.hiddenBanner()
```



[OC 版本的RPBannerView](https://github.com/dengfeng520/RPBannerView)
