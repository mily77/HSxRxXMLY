//
//  HSNavDownloadable.swift
//  HSxRxXMLY
//
//  Created by emily on 2018/3/29.
//  Copyright © 2018年 emily. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx

protocol HSNavDownloadable {
    
}

extension HSNavDownloadable where Self : UIViewController {
    
    func download(onNext: @escaping ()->Void) {
        
        let item = UIBarButtonItem(image: UIImage(named: "top_download_n"), style: .plain, target: nil, action: nil)
        item.rx.tap.do(onNext: {
            onNext()
        }).subscribe().disposed(by: rx.disposeBag)
        
        if (navigationItem.rightBarButtonItems?.count ?? 0) == 0 {
            navigationItem.rightBarButtonItems = [item]
        } else {
            var items: [UIBarButtonItem] = [] + navigationItem.rightBarButtonItems!
            items.append(item)
            navigationItem.rightBarButtonItems = items
        }
    }
}

