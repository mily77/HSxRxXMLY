//
//  HSRecommendHeaderView.swift
//  HSxRxXMLY
//
//  Created by emily on 2018/8/1.
//  Copyright © 2018年 emily. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import RxDataSources
import ReusableKit

fileprivate struct Metric {
    static let defaultHeight : CGFloat = 135.0
}

fileprivate enum Reusable {
    
}

class HSRecommendHeaderView: UICollectionReusableView {

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var bottomView: UIView!
    
    @IBOutlet weak var leftTitle: UILabel!
    @IBOutlet weak var leftSubView: UIView!
    @IBOutlet weak var leftSubTitle: UILabel!
    
    @IBOutlet weak var rightSubView: UIView!
    @IBOutlet weak var rightSubTitle: UILabel!
    
    @IBOutlet weak var tagView1: UIView!
    @IBOutlet weak var tagView2: UIView!
    @IBOutlet weak var tagView3: UIView!
    @IBOutlet weak var tagView4: UIView!
    
    @IBOutlet weak var tagLab1: UILabel!
    @IBOutlet weak var tagLab2: UILabel!
    @IBOutlet weak var tagLab3: UILabel!
    @IBOutlet weak var tagLab4: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
