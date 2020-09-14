//
//  RPBanner.swift
//  RunUIKit
//
//  Created by rp.wang on 2020/9/9.
//  Copyright © 2020 Beijing Physical Fitness Sport Science and Technology Co.,Ltd. All rights reserved.
//

import UIKit

public class RPBanner: ShowBannerProtocol {
    static var bannerView: RPBannerView!
    
    public static func showBanner<T>(_ r: T) where T : BannerDisplayProtocol {
        DispatchQueue.main.async {
            let addView = r.addView ?? self.windows ?? UIView()
            if RPBannerView.bannerForView(addView: addView) != nil  {
                return
            }
            let mode = r.showMode ?? .popMode
            bannerView = RPBannerView(r.title!, r.backColor!, r.titleColor!, r.top!, addView, r.showTime!, mode, r.titleFontSize!)
        }
    }
    
    public static func hiddenBanner() {
        bannerView.hiddenBanner(0)
    }
}

extension RPBanner {
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
