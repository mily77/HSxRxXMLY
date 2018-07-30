//
//  HSHomeSearchBarable.swift
//  HSxRxXMLY
//
//  Created by emily on 2018/7/25.
//  Copyright © 2018年 emily. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxGesture
import NSObject_Rx
import Then
import SnapKit

// MARK:- 常量
fileprivate struct Metric {
    
    static let title: String = "养生 | 健身 | 艾灸 | 国家宝藏 | 72小时情感急症室"
    static let fontSize: CGFloat = 13.0
    
    static let iconWidth: CGFloat = 20.0
    static let searchBarWidth: CGFloat = kScreenW - MetricGlobal.margin * 16
    static let searchBarHeight: CGFloat = 30.0
}

protocol HSHomeSearchBarable {
    
}

extension HSHomeSearchBarable where Self : UIView {
    // MARK:- 自定义组件
    func searchBar(model:HSNavigationBarItemModel,onNext: @escaping (_ HSNavigationBarItemModel: HSNavigationBarItemModel) ->Void) -> UIView {
        
        // 创建组件
        let view = UIView.init().then { (make) in
            make.backgroundColor = UIColor.clear
        }
        let backView = UIView().then { (make) in
            make.backgroundColor = kThemeGainsboroColor
            make.layer.cornerRadius = Metric.searchBarHeight / 2
            make.rx.tapGesture().when(.recognized).subscribe({ (_) in
                onNext(model)
            }).disposed(by: rx.disposeBag)
        }
        let icon = UIImageView().then { (make) in
            make.contentMode = .scaleAspectFit
            make.image = UIImage(named: "search_btn_norm")
        }
        
        let lab = UILabel().then { (make) in
            make.textColor = kThemeGreyColor
            make.font = UIFont.systemFont(ofSize: Metric.fontSize)
            make.text = Metric.title
        }
        // 添加组件
        backView.addSubview(icon)
        backView.addSubview(lab)
        view.addSubview(backView)
        self.addSubview(view)
        
        // 添加约束
        view.snp.makeConstraints { (make) in
            make.width.equalTo(Metric.searchBarWidth)
            make.height.equalTo(Metric.searchBarHeight)
        }
        
        backView.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalToSuperview()
        }
        
        icon.snp.makeConstraints { (make) in
            make.width.equalTo(Metric.iconWidth)
            make.left.equalToSuperview().offset(MetricGlobal.margin)
            make.centerY.equalToSuperview()
        }
        
        lab.snp.makeConstraints { (make) in
            make.left.equalTo(icon.snp.right).offset(MetricGlobal.margin / 2)
            make.centerY.equalTo(icon)
            make.right.lessThanOrEqualToSuperview().offset(-MetricGlobal.margin)
        }
        return view
    }
}
