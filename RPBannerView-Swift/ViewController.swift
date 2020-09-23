//
//  ViewController.swift
//  RPBannerView-Swift
//
//  Created by rp.wang on 2020/9/9.
//  Copyright © 2020 Beijing Physical Fitness Sport Science and Technology Co.,Ltd. All rights reserved. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var touchNum = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchNum = touchNum + 1
        if touchNum % 2 == 0 {
            var display = BannerDisplay()
            display.title = "this is test text.... this is test text.... this is test text...."
            display.showMode = .popMode
            display.addView = view
            display.showTime = 5
            display.top = 15
            display.backColor = UIColor(red: 245.0/255.0, green: 190.0/255.0, blue: 98.0/255.0, alpha: 1)
            display.titleColor = .white
            display.titleFontSize = 14.5
            RPBanner.showBanner(display)
        } else {
            RPBanner.hiddenBanner()
        }
    }
}

extension UIColor {
    class func hexStringToColor(_ hexadecimal: String) -> UIColor {
        var cstr = hexadecimal.trimmingCharacters(in:  CharacterSet.whitespacesAndNewlines).uppercased() as NSString;
        if (cstr.length < 6) {
            return .clear
        }
        if (cstr.hasPrefix("0X")) {
            cstr = cstr.substring(from: 2) as NSString
        }
        if (cstr.hasPrefix("#")) {
            cstr = cstr.substring(from: 1) as NSString
        }
        if (cstr.length != 6) {
            return .clear
        }
        var range = NSRange()
        range.location = 0
        range.length = 2
        let rStr = cstr.substring(with: range)
        range.location = 2
        let gStr = cstr.substring(with: range)
        range.location = 4
        let bStr = cstr.substring(with: range)
        var r :UInt32 = 0x0
        var g :UInt32 = 0x0
        var b :UInt32 = 0x0
        Scanner(string: rStr).scanHexInt32(&r)
        Scanner(string: gStr).scanHexInt32(&g)
        Scanner(string: bStr).scanHexInt32(&b)
        return UIColor(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: 1)
    }
}
