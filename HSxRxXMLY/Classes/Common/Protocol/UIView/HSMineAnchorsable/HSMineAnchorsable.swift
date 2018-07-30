//
//  HSMineAnchorsable.swift
//  HSxRxXMLY
//
//  Created by emily on 2018/4/8.
//  Copyright © 2018年 emily. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx
import Then
import SnapKit
import RxGesture

fileprivate struct Metric{
    static let title: String = "主播工作台"
    static let fontSize: CGFloat = 15.0
}

protocol HSMineAnchorsable {
    
}

extension HSMineAnchorsable where Self : UIView{
    func mineAnchors(model: HSNavigationBarItemModel, onNext: @escaping (_ model: HSNavigationBarItemModel) ->Void) -> (UIView,UIView) {
        //创建组件
        let view = UIView().then {
            $0.backgroundColor = UIColor.clear
            $0.rx.tapGesture().when(.recognized).subscribe({_ in onNext(model)
            }).disposed(by: rx.disposeBag)
        }
        let backgroundView = UIView().then {
            $0.backgroundColor = kThemeOrangeRedColor
        }
        let lab = UILabel().then { (label) in
            label.textColor = UIColor.black
            label.font = UIFont.systemFont(ofSize: Metric.fontSize)
            label.text = Metric.title
        }
        
        let icon = UIImageView().then { (img) in
            img.contentMode = .scaleAspectFit
            img.image = UIImage(named: "PHGradeArrow")
        }
        //添加组件
        view.addSubview(backgroundView)
        view.addSubview(lab)
        view.addSubview(icon)
        
        self.addSubview(view)
        
        //添加约束
        backgroundView.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalToSuperview()
        }
        icon.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(MetricGlobal.margin)
            make.right.equalToSuperview().offset(-MetricGlobal.margin)
            make.centerY.equalToSuperview()
        }
        lab.snp.makeConstraints { (make) in
            make.right.equalTo(icon.snp.left).offset(-MetricGlobal.margin)
            make.centerY.equalTo(icon)
            make.left.equalToSuperview().offset(MetricGlobal.margin)
        }
        return (view,backgroundView)
    }
}
