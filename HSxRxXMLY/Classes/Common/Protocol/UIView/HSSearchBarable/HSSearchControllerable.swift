//
//  HSSearchControllerable.swift
//  HSxRxXMLY
//
//  Created by emily on 2018/7/26.
//  Copyright © 2018年 emily. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import RxGesture
import NSObject_Rx
import Then
import SnapKit

// MARK:- 常量
fileprivate struct Metric {
    static let title: String = "搜索专辑、主播、广播、声音、大吉大利，晚上吃鸡"
    static let labFontSize: CGFloat = 13.0
    static let btnFontSize: CGFloat = 15.0
    
    static let searchBarWidth: CGFloat = kScreenW - MetricGlobal.margin * 2
    static let searchBarHeight: CGFloat = 30.0
    
    static let searchIconWidth: CGFloat = 30.0
    static let recordIconWidth: CGFloat = 20.0
    static let cancelBtnWidth: CGFloat = 40.0
}

protocol HSSearchControllerable {
    
}

extension HSSearchControllerable where Self : UIView {
    // MARK:- 自定义组件
    func searchBar(model: HSNavigationBarItemModel, onNext: @escaping (_ model: HSNavigationBarItemModel)->Void) -> UIView {
        let view = UIView().then { (make) in
            make.backgroundColor = UIColor.clear
            
            self.addSubview(make)
            
            make.snp.makeConstraints({ (make) in
                make.width.equalTo(Metric.searchBarWidth)
                make.height.equalTo(Metric.searchBarHeight)
            })
        }
        let backView = UIView().then { (make) in
            make.backgroundColor = kThemeGainsboroColor
            make.layer.cornerRadius = Metric.searchBarHeight / 2
        }
        let icon = UIImageView().then { (make) in
            make.contentMode = .scaleAspectFit
            make.image = UIImage(named: "search_btn_norm")
        }
        let searchField = UITextField().then { (make) in
            make.clearButtonMode = .whileEditing
            make.becomeFirstResponder() // 成为焦点
            make.tintColor = kThemeTomatoColor // 光标颜色
            make.font = UIFont.systemFont(ofSize: Metric.labFontSize)
            make.placeholder = Metric.title
            // 处理点击事件
            make.rx.tapGesture().when(UIGestureRecognizerState.recognized).subscribe({ _ in
                var tModel = model
                tModel.type = .searchBar(index: 1, desc: "输入框")
                onNext(tModel)
            }).disposed(by: rx.disposeBag)
        }
        let record = UIImageView().then { (make) in
            make.contentMode = .scaleAspectFit
            make.image = UIImage(named: "MCRecord")
            make.rx.tapGesture().when(UIGestureRecognizerState.recognized).subscribe({ (_) in
                var tModel = model
                tModel.type = .searchBar(index: 2, desc: "录音按钮")
                onNext(tModel)
            }).disposed(by: rx.disposeBag)
        }
        let cancel = UIButton().then { (make) in
            // 设置属性
            make.setTitle("取消", for: .normal)
            make.setTitleColor(kThemeDimGrayColor, for: .normal)
            make.setTitleColor(kThemeGreyColor, for: .highlighted)
            make.titleLabel?.font = UIFont.systemFont(ofSize: Metric.btnFontSize)
            // 处理点击事件
            make.rx.tap.do(onNext:{
                var tModel = model
                tModel.type = .searchBar(index: 3, desc: "取消按钮")
                onNext(tModel)
            }).subscribe().disposed(by: rx.disposeBag)
        }
        
        // 添加组件
        backView.addSubview(icon)
        backView.addSubview(searchField)
        backView.addSubview(record)
        
        view.addSubview(backView)
        view.addSubview(cancel)

        // 添加约束
        // 此处必须指定一个大小
        backView.snp.makeConstraints { (make) in
            make.left.top.bottom.equalToSuperview()
            make.right.equalTo(cancel.snp.left).offset(-MetricGlobal.margin / 2)
        }
        
        cancel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.width.equalTo(Metric.cancelBtnWidth)
            make.right.equalToSuperview()
        }
        icon.snp.makeConstraints { (make) in
            make.width.equalTo(Metric.searchIconWidth)
            make.left.equalToSuperview().offset(MetricGlobal.margin / 2)
            make.centerY.equalToSuperview()
        }
        
        searchField.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(MetricGlobal.margin / 4)
            make.left.equalTo(icon.snp.right)
            make.centerY.equalTo(icon)
            make.right.lessThanOrEqualTo(record.snp.left)
        }
        
        record.snp.makeConstraints { (make) in
            make.centerY.equalTo(icon)
            make.width.equalTo(Metric.recordIconWidth)
            make.right.equalToSuperview().offset(-MetricGlobal.margin / 2)
        }
        
        return view
    }
}

