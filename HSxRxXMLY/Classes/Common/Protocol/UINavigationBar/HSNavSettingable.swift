//
//  HSNavSettingable.swift
//  HSxRxXMLY
//
//  Created by emily on 2018/3/29.
//  Copyright © 2018年 emily. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx

protocol HSNavSettingable {
    
}

extension HSNavSettingable where Self : UIViewController{
    func setting(onNext: @escaping ()->Void) {
        
        let item = UIBarButtonItem(image: UIImage(named: "meSetNor"), style: .plain, target: nil, action: nil)
        item.rx.tap.do(onNext: {
            onNext()
        }).subscribe().disposed(by: rx.disposeBag)
        
        if (navigationItem.leftBarButtonItems?.count ?? 0) == 0 {
            navigationItem.leftBarButtonItems = [item]
        } else {
            var items: [UIBarButtonItem] = [] + navigationItem.leftBarButtonItems!
            items.append(item)
            navigationItem.leftBarButtonItems = items
        }
    }
}
