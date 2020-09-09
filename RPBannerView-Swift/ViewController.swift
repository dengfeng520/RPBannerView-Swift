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
            RPBanner.showBanner(BannerDisplay(title: "Physical Fitness Sport Science and Technology Co.,Ltd." ,addView: view ,time: 0, mode: .mobileMode))
        } else {
            RPBanner.hiddenBanner()
        }
    }

}

