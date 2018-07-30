//
//  HSSettingViewController.swift
//  HSxRxXMLY
//
//  Created by emily on 2018/6/13.
//  Copyright © 2018年 emily. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx
import RxDataSources
import ReusableKit
import Then
import RxGesture

// MARK:- 复用
private enum Reusable {
//    static let settingCell = ReusableCell<>()
}

// MARK:- 常量
fileprivate struct Metric{
    static let sectionHeight: CGFloat = 10.0
}


class HSSettingViewController: BaseViewController {

    // View
    private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension HSSettingViewController: HSNavBackable, HSNavUniversalable {
    private func initEnableMudule(){
        let models = [HSNavigationBarItemMetric.back]
        self.universals(modelArr: models) { [weak self] (model) in
            guard self != nil else { return }
            HCLog(model.description)
            let type = model.type
            switch type {
            case .back:
                self?.navigationController?.popViewController(animated: true)
                break
            default: break
            }
            
        }
        
    }
}

extension HSSettingViewController {
    private func initUI() {
        self.title = "设置"
        
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = kThemeGainsboroColor
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 60.0))
        view.addSubview(tableView)
        self.tableView = tableView
        
        tableView.snp.makeConstraints { (make) in
            make.left.top.right.bottom.equalToSuperview()
        }
        
        // 设置代理
        tableView.rx.setDelegate(self as! UITableViewDelegate).disposed(by: rx.disposeBag)
        // 注册cell
//        tableView.register(Reusable.)
    }
}
