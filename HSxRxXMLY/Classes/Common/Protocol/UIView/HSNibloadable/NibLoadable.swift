//
//  NibLoadable.swift
//  HSxRxXMLY
//
//  Created by emily on 2018/4/8.
//  Copyright © 2018年 emily. All rights reserved.
//

import UIKit

protocol NibLoadable {
    
}

extension NibLoadable where Self : UIView {
    static func loadFormNib(_ nibName: String? = nil) -> Self {
        return Bundle.main.loadNibNamed(nibName ?? "\(self)", owner: nil, options: nil)?.first as! Self
    }
}
