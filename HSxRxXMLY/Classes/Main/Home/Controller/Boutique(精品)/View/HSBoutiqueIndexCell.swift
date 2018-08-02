//
//  HSBoutiqueIndexCell.swift
//  HSxRxXMLY
//
//  Created by emily on 2018/8/1.
//  Copyright © 2018年 emily. All rights reserved.
//

import UIKit


fileprivate struct Metric {
    static let margin : CGFloat = 10
    static let height : CGFloat = 38
    static let column : CGFloat = 5
    static let singleColumn : CGFloat = 4.5
}

class HSBoutiqueIndexCell: UICollectionViewCell {

    @IBOutlet weak var bottomLine: UIView!
    @IBOutlet weak var titleLab: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bottomLine.backgroundColor = kThemeOrangeRedColor
    }
    
    static func itemMargin() -> CGFloat {
        return Metric.margin
    }
    
    static func itemSize() -> CGSize {
        // 结合FlowLayout 设置
        let width = (kScreenW - Metric.margin * (Metric.column - 1 + 3)) / Metric.column
        return CGSize (width: width, height: Metric.height)
        
    }

    static func singleItemSize() -> CGSize {
        // 结合 FlowLayout 设置
        let width = (kScreenW - Metric.margin * (Metric.singleColumn - 1 + 1.5)) / Metric.singleColumn
        
        return CGSize(width: width, height: Metric.height)
    }
    
}
