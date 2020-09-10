//
//  BannerProtocol.swift
//  RunUIKit
//
//  Created by rp.wang on 2020/9/9.
//  Copyright © 2020 Beijing Physical Fitness Sport Science and Technology Co.,Ltd. All rights reserved.
//

import UIKit

public enum BannerShowMode {
    case popMode
    case mobileMode
    case gradientMode
}

public protocol BannerDisplayProtocol {
    var title: String? { get }
    // background color
    var backColor: UIColor? { get }
    // 距离顶部距离
    var top: CGFloat? { get }
    var addView: UIView? { get }
    var showTime: Float? { get }
    var showMode: BannerShowMode? { get }
    var titleFontSize: CGFloat? { get }
}

public struct BannerDisplay: BannerDisplayProtocol {
    public var title: String?
    public var backColor: UIColor?
    public var top: CGFloat?
    public var addView: UIView?
    public var showTime: Float?
    public var showMode: BannerShowMode?
    public var titleFontSize: CGFloat?
    var windows: UIWindow?
    
    public init(title: String? = "Loading...", backColor: UIColor? = UIColor.init(red: 48/255.0, green: 48/255.0, blue: 48/255.0, alpha: 1), top: CGFloat? = 30, addView: UIView? = nil, time: Float? = 1.5, mode: BannerShowMode? = nil, fontSize: CGFloat? = 13) {
        self.title = title
        self.backColor = backColor
        self.top = top
        self.addView = addView
        self.showTime = time
        self.showMode = mode
        self.titleFontSize = fontSize
    }
}

protocol ShowBannerProtocol {
    static func showBanner<T>(_ r: T) where T : BannerDisplayProtocol
    static func hiddenBanner()
}

