//
//  BaseNavigationController.swift
//  HSxRxXMLY
//
//  Created by emily on 2018/3/26.
//  Copyright © 2018年 emily. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        HCLog("init: \(type(of: self))")
        
        // 设置导航栏样式
        navigationBar.setBackgroundImage(UIImage.color(kThemeWhiteColor), for: UIBarPosition.any, barMetrics: .default)
        navigationBar.shadowImage = UIImage()
        
        //标题样式
        let bar = UINavigationBar.appearance()
        bar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.black,NSAttributedStringKey.font : UIFont.systemFont(ofSize: 18)]
        
        //设置返回按钮的样式
        navigationBar.tintColor = kThemeBlackColor
        let barItem = UIBarButtonItem.appearance()
        barItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor : kThemeBlackColor], for: .normal)
        
    }
    deinit {
        HCLog("deinit: \(type(of: self))")
    }

}
extension BaseViewController{
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}

