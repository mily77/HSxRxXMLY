//
//  HSBoutiqueIndexFlowLayout.swift
//  HSxRxXMLY
//
//  Created by emily on 2018/8/1.
//  Copyright © 2018年 emily. All rights reserved.
//

import UIKit

class HSBoutiqueIndexFlowLayout: UICollectionViewFlowLayout {
    override init() {
        super.init()
        
        self.scrollDirection = .vertical
        self.itemSize = HSBoutiqueIndexCell.itemSize()
        self.minimumLineSpacing = 0.0
        let margin = HSBoutiqueIndexCell.itemMargin()
        self.sectionInset = UIEdgeInsetsMake(0, margin * 1.5, 0, margin * 1.5)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
