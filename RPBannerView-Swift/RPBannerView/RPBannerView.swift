//
//  RPBanner.swift
//  RunUIKit
//
//  Created by rp.wang on 2020/9/9.
//  Copyright © 2020 Beijing Physical Fitness Sport Science and Technology Co.,Ltd. All rights reserved.
//

import UIKit

public class RPBannerView: ShowBannerProtocol {
    static var bannerView: RPSubBannerView!
    
    public static func showBanner<T>(_ r: T) where T : BannerDisplayProtocol {
        DispatchQueue.main.async {
            let addView = r.addView ?? self.windows ?? UIView()
            if RPSubBannerView.bannerForView(addView: addView) != nil  {
                return
            }
            let mode = r.showMode ?? .popMode
            bannerView = RPSubBannerView(r.title!, r.backColor!, r.titleColor!, r.top!, addView, r.showTime!, mode, r.titleFontSize!)
        }
    }
    
    public static func hiddenBanner() {
        bannerView.hiddenBanner(0)
    }
}

// 兼容OC版
extension RPBannerView {
    public class func show(with mode: BannerMode, body: String, isView: UIView) {
        var bgColor: UIColor
        if mode == .warningMode {
            bgColor = UIColor(red: 248.0/255.0, green: 73.0/255.0, blue: 73.0/255.0, alpha: 1)
        } else if mode == .successMode {
            bgColor = UIColor(red: 62.0/255.0, green: 205.0/255.0, blue: 161.0/255.0, alpha: 1)
        } else {
            bgColor = UIColor(red: 48.0/255.0, green: 48.0/255.0, blue: 48.0/255.0, alpha: 1)
        }
        RPBannerView.showBanner(BannerDisplay(title: body, backColor: bgColor, addView: isView, time: 1.5))
    }
}

extension RPBannerView {
    static var windows: UIWindow? {
        if #available(iOS 13.0, *) {
            for windowScene: UIWindowScene in ((UIApplication.shared.connectedScenes as? Set<UIWindowScene>)!) {
                if windowScene.activationState == UIScene.ActivationState.foregroundActive {
                    return windowScene.windows.first
                }
            }
        } else {
            return UIApplication.shared.keyWindow
        }
        return nil
    }
}
