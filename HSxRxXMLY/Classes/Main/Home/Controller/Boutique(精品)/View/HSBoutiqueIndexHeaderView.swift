//
//  HSBoutiqueIndexHeaderView.swift
//  HSxRxXMLY
//
//  Created by emily on 2018/8/2.
//  Copyright © 2018年 emily. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources
import ReusableKit

fileprivate struct Metric {
    static let defaultHeight : CGFloat = 135.0
}

fileprivate enum Reusable {
    static let boutiqueIndexCell = ReusableCell<HSBoutiqueIndexCell>(nibName: "HSBoutiqueIndexCell")
}

class HSBoutiqueIndexHeaderView: UICollectionReusableView {
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var bottomLine: UIView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var bottomLeftLab: UILabel!
    @IBOutlet weak var bottomRightView: UIView!
    
    // MARK:- 成功回调
//    typealias AddBlock = (_ indexModel: )
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
