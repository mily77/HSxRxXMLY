//
//  HSHomeNavigationBar.swift
//  HSxRxXMLY
//
//  Created by emily on 2018/7/25.
//  Copyright © 2018年 emily. All rights reserved.
//

import UIKit

fileprivate struct Metric {
    static let homeBarWidth: CGFloat = kScreenW
    static let homeBarHeight: CGFloat = 44.0
}


class HSHomeNavigationBar: UIView {

    typealias AddBlock = (_ model: HSNavigationBarItemModel)->Void
    var itemClicked: AddBlock? = { (_) in
        return
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initHomeNavigationBar()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //此处必须指定一个大小
        self.snp.makeConstraints { (make) in
            make.width.equalTo(Metric.homeBarWidth)
            make.height.equalTo(Metric.homeBarHeight)
        }
    }
    
}

extension HSHomeNavigationBar: HSNavUniversalable, HSHomeSearchBarable {
    // MARK:- 初始化 首页 导航栏组件
    func initHomeNavigationBar() {
        // 消息按钮
        let message = self.universal(model: HSNavigationBarItemMetric.messge) { (model) in
            self.itemClicked!(model)
            HCLog(model.description)
        }
        
        // 历史记录
        let history = self.universal(model: HSNavigationBarItemMetric.history) { (model) in
            self.itemClicked!(model)
            HCLog(model.description)
        }
        
        //下载
        let download = self.universal(model: HSNavigationBarItemMetric.download) { (model) in
            self.itemClicked!(model)
            HCLog(model.description)
        }
        // 搜索栏
        let searchBar = self.searchBar(model: HSNavigationBarItemMetric.homeSearchBar) { (model) in
            self.itemClicked!(model)
            HCLog(model.description)
        }
        // 布局
        message.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview()
        }
        
        searchBar.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(message.snp.right).offset(MetricGlobal.margin)
        }
        
        history.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(searchBar.snp.right).offset(MetricGlobal.margin)
        }
        
        download.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(history.snp.right).offset(MetricGlobal.margin)
            make.right.equalToSuperview()
        }
    }
}
