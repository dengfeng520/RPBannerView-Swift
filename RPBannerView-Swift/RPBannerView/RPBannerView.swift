//
//  RPBannerView.swift
//  RunUIKit
//
//  Created by rp.wang on 2020/9/9.
//  Copyright © 2020 Beijing Physical Fitness Sport Science and Technology Co.,Ltd. All rights reserved.
//

import UIKit

class RPBannerView: UIView, BannerDisplayProtocol {
    var showTime: Float?
    var titleFontSize: CGFloat?
    var title: String?
    var backColor: UIColor?
    var top: CGFloat?
    var addView: UIView?
    var showMode: BannerShowMode?
    
    var titleLab: UILabel = UILabel()
    var topLayout: NSLayoutConstraint!
    var centerXLayout: NSLayoutConstraint!
    var rp_screenWidth: CGFloat {
        return UIScreen.main.bounds.size.width
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(_ title: String, _ bgColor: UIColor, _ top: CGFloat, _ addView: UIView, _ showTime: Float, _ mode: BannerShowMode, _ size: CGFloat) {
        self.init()
        self.title = title
        self.backColor = bgColor
        self.top = top
        self.addView = addView
        self.showMode = mode
        self.titleFontSize = size
        self.showTime = showTime
        self.configUI()
        self.configBannerAnimation()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configUI() {
        self.addView!.addSubview(self)
        if self.showMode == .mobileMode {
            var topnum = self.top!
            if isiPhoneX == true {
                topnum = self.top! + 34
            }
            self.frame = CGRect(x: -rp_screenWidth, y: topnum, width: 0, height: 0)
        } else {
            self.frame = CGRect(x: rp_screenWidth / 2, y: 0, width: 0, height: 0)
        }
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if self.showMode == .popMode {
            self.topLayout = self.topAnchor.constraint(equalTo: addView!.safeAreaLayoutGuide.topAnchor, constant: -50)
            self.topLayout.isActive = true
            self.centerXAnchor.constraint(equalTo: addView!.centerXAnchor, constant: 0).isActive = true
            self.topLayout.constant = self.top ?? 8
        } else if self.showMode == .mobileMode {
            self.topAnchor.constraint(equalTo: addView!.safeAreaLayoutGuide.topAnchor, constant: self.top!).isActive = true
            self.centerXLayout = self.centerXAnchor.constraint(equalTo: addView!.centerXAnchor, constant: -rp_screenWidth / 2)
            self.centerXLayout.isActive = true
            self.centerXLayout.constant = 0
        } else {
            self.topAnchor.constraint(equalTo: addView!.safeAreaLayoutGuide.topAnchor, constant: self.top!).isActive = true
            self.centerXAnchor.constraint(equalTo: addView!.centerXAnchor, constant: 0).isActive = true
            self.alpha = 0
        }
        
        self.heightAnchor.constraint(greaterThanOrEqualToConstant: 20).isActive = true
        self.widthAnchor.constraint(lessThanOrEqualTo: addView!.widthAnchor, multiplier: 0.9).isActive = true
        self.backgroundColor = backColor
        
        self.addSubview(titleLab)
        titleLab.translatesAutoresizingMaskIntoConstraints = false
        titleLab.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        titleLab.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15).isActive = true
        titleLab.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15).isActive = true
        titleLab.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5).isActive = true
        titleLab.text = self.title
        titleLab.font = UIFont(name: "PingFangTC-Semibold", size: self.titleFontSize!)
        titleLab.numberOfLines = 0
        
        self.layoutIfNeeded()
        self.layer.cornerRadius = self.frame.size.height / 2
    }
    
    private func configBannerAnimation() {
        UIView.animate(withDuration: 0.35) { [weak self] in
            guard let `self` = self else { return }
            if self.showMode == .gradientMode {
                self.alpha = 1
            } else {
                self.superview?.layoutIfNeeded()
            }
        }
        
        let time = self.showTime! * 1000
        if time == 0 {
            return
        }
        self.hiddenBanner(Int(time))
    }
    
    func hiddenBanner(_ time: Int) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(Int(time))) { [weak self] in
            guard let `self` = self else { return }
            if self.showMode == .popMode {
                self.topLayout.constant = -50
            } else if self.showMode == .mobileMode {
                self.centerXLayout.constant = -self.rp_screenWidth / 2
            }
            UIView.animate(withDuration: 0.35, animations: {
                if self.showMode == .gradientMode {
                    self.alpha = 0
                } else {
                    self.superview?.layoutIfNeeded()
                }
            }) { (failer) in
                self.removeFromSuperview()
            }
        }
    }
    
    // TODO: - 判断banner 在当前View上是否已经显示了
    class func bannerForView(addView: UIView) -> RPBannerView? {
        var retView: RPBannerView? = nil
        addView.subviews.forEach { (subView) in
            if subView.isKind(of: RPBannerView.self as AnyClass) {
                retView = subView as? RPBannerView
            }
        }
        return retView
    }
    
    /// 当前设备是否是iPhone X之后的机型
    public var isiPhoneX: Bool {
        if #available(iOS 11.0, *) {
            let keyWindow = UIApplication.shared.keyWindow
            let bottomSafeInset = keyWindow?.safeAreaInsets.bottom
            if bottomSafeInset == 34 || bottomSafeInset == 21 {
                return true
            }
        }
        return false
    }
    
    deinit {
        print("deinit-----------------------")
    }
}
