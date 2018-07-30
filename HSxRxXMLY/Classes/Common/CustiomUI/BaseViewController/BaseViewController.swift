//
//  BaseViewController.swift
//  HSxRxXMLY
//
//  Created by emily on 2018/3/26.
//  Copyright © 2018年 emily. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        HCLog("init: \(type(of: self))")
        
        view.backgroundColor = kThemeGainsboroColor
    }
    
    deinit {
        HCLog("deinit:\(type(of: self))")
    }
    
}

extension BaseNavigationController{
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}
