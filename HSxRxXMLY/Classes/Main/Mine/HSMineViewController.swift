//
//  HSMineViewController.swift
//  HSxRxXMLY
//
//  Created by emily on 2018/3/28.
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
fileprivate struct Metric {
    
    static let searchBarLeft: CGFloat = 12.0
    static let searchBarRight: CGFloat = 12.0
    
    static let cellHeight: CGFloat = 49.0
    static let sectionHeight: CGFloat = 10.0
    
    static let marginTop: CGFloat = 90.0 // 调整顶部背景图片位置
    static let navbarColorChangePoint: CGFloat = -Metric.marginTop / 2 // 调整导航栏渐变开始位置
}
class HSMineViewController: BaseViewController {

    //View
    private var titleView: UIView?
    private var tableView: UITableView!
    private lazy var imageView = UIImageView().then {
        $0.backgroundColor = kThemeWhiteColor
        $0.contentMode = .scaleAspectFit
        $0.image = UIImage(named: "favicon")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.backgroundColor = .clear
        self.navigationController?.navigationBar.barTintColor = .clear
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        self
        
        if let tabbarVC = self.tabBarController as? HSMainViewController {
            tabbarVC.isHiddenPlayView(false)
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //修正push 后导航栏灰色
        self.navigationController?.navigationBar.backgroundColor = kThemeWhiteColor
        self.navigationController?.navigationBar.barTintColor = kThemeWhiteColor
        //移除
        self.navigationController?.navigationBar.Mg_reset()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        titleView?.snp.makeConstraints({ (make) in
            make.centerY.equalToSuperview().offset(-0.5)
            make.left.equalToSuperview().offset(Metric.searchBarLeft)
            make.right.equalToSuperview()
        })
    }

}

extension HSMineViewController: HSNavTitleable {
    // MARK:- 标题组件
    private func initTitleView() {
        
        let mineNavigationBar = HSMineNavigationBar()
        mineNavigationBar.itemClicked = { [weak self] (model) in
            guard self != nil else { return }
//            self.jump2Login()
        }
        titleView = self.titleView(titleView: mineNavigationBar)
    }
    
}

private let tempScale: CGFloat = 104 / 600

// MARK:- UIScrollView
extension HSMineViewController {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        // 调整导航栏背景色渐变
        let offsetY: CGFloat = scrollView.contentOffset.y
        HCLog(" offsetY:\(offsetY)")
        if offsetY < Metric.navbarColorChangePoint {
            let alpha: CGFloat = max(0, 1 - (Metric.navbarColorChangePoint - offsetY) / kNavibarH)
            HCLog(" alpha:\(alpha)")
            self.navigationController?.navigationBar.Mg_setBackgroudColor(backgroundColor: kThemeWhiteColor.withAlphaComponent(alpha))
        } else {
            self.navigationController?.navigationBar.Mg_setBackgroudColor(backgroundColor: kThemeWhiteColor.withAlphaComponent(1))
        }
        
        // 缩放图片
        if (offsetY < 0) {
            // 减去初始部分
            let scaleXY = 1  - tempScale + offsetY / (-600)
            imageView.transform = CGAffineTransform(scaleX: scaleXY, y: scaleXY)
        }
    }
}

extension HSMineViewController {
    //MARK:- 登录
    func jump2Login() {
        let VC = BaseNavigationController.init(rootViewController: HSLoginViewController())
        self.present(VC, animated: true, completion: nil)
        
    }
    
    //MARK:- 设置
    func jump2Setting() {
//        let VC = h
    }
    
}
