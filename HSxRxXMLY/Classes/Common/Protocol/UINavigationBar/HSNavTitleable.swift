//
//  HSNavTitleable.swift
//  HSxRxXMLY
//
//  Created by emily on 2018/3/29.
//  Copyright © 2018年 emily. All rights reserved.
//

import UIKit

protocol HSNavTitleable {
    
}

extension HSNavTitleable where Self : UIViewController {
    
    // MARK:- 导航栏 自定义标题 通用组件
    func titleView(titleView : UIView) -> UIView {
        
        navigationItem.titleView = titleView
        return titleView
    }
}

