<p align="center">RPBannerView</P>

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
