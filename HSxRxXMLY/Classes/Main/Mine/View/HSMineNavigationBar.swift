//
//  HSMineNavigationBar.swift
//  HSxRxXMLY
//
//  Created by emily on 2018/3/28.
//  Copyright © 2018年 emily. All rights reserved.
//

import UIKit

fileprivate struct Metric {
    static let homeBarWidth: CGFloat = kScreenW
    static let homeBarHeight: CGFloat = 44.0
}

class HSMineNavigationBar: UIView {
    private var mineAnchorsBackgroundView:UIView?
    typealias AddBlock = (_ model: HSNavigationBarItemModel)->Void
    var itemClicked: AddBlock? = {(_) in
        return
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        self.snp.makeConstraints { (make) in
            make.width.equalTo(Metric.homeBarWidth)
            make.height.equalTo(Metric.homeBarHeight)
        }
        
        let corners: UIRectCorner = [.bottomLeft,.topLeft]
        mineAnchorsBackgroundView?.clipCorner(direction: corners, radius: 14)
        mineAnchorsBackgroundView?.alpha = 0.35
        
    }
    
}

extension HSMineNavigationBar: HSMineAnchorsable, HSNavUniversalable {
    // MARK:- 初始化 我的 导航栏组件
    func initMinNavigationBar() {
        // 消息按钮
        let message = self.universal(model: HSNavigationBarItemMetric.meMessage) { [weak self]  (model) in
            
            guard let `self` = self else { return }
            self.itemClicked!(model)
            HCLog(model.description)
        }
        // 设置
        let setting = self.universal(model: HSNavigationBarItemMetric.setting) { [weak self]  (model) in
            
            guard let `self` = self else { return }
            self.itemClicked!(model)
            HCLog(model.description)
        }
        
        // 主播工作台
        let (mineAnchors, backgroundView) = self.mineAnchors(model: HSNavigationBarItemMetric.mineAnchors) { [weak self] (model) in
            
            guard let `self` = self else { return }
            self.itemClicked!(model)
            HCLog(model.description)
        }
        self.mineAnchorsBackgroundView = backgroundView
        
        // 布局
        message.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview()
        }
        
        setting.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(message.snp.right).offset(MetricGlobal.margin)
        }
        
        mineAnchors.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview()
        }
    }
}
