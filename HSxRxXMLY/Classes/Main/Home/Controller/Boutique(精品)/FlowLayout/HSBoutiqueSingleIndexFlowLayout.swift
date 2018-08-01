//
//  HSBoutiqueSingleIndexFlowLayout.swift
//  HSxRxXMLY
//
//  Created by emily on 2018/8/1.
//  Copyright © 2018年 emily. All rights reserved.
//

import UIKit

class HSBoutiqueSingleIndexFlowLayout: UICollectionViewFlowLayout {

    override init() {
        super.init()
        self.scrollDirection = .horizontal
        self.itemSize = HSBoutiqueIndexCell.singleItemSize()
        self.minimumLineSpacing = 0.0
        let margin = HSBoutiqueIndexCell.itemMargin()
        self.sectionInset = UIEdgeInsetsMake(0, margin * 1.5, 0, 0)
    }
    init(_ scrollDirection: UICollectionViewScrollDirection) {
        
        super.init()
        if scrollDirection == .horizontal {
            
            self.scrollDirection = scrollDirection
            self.itemSize = HSBoutiqueIndexCell.singleItemSize()
            self.minimumLineSpacing = 0.0
            let margin = HCBoutiqueIndexCell.itemMargin()
            self.sectionInset = UIEdgeInsetsMake(0, margin * 1.5, 0, 0)
            
        } else {
            self.scrollDirection = scrollDirection
            self.itemSize = HSBoutiqueIndexCell.itemSize()
            self.minimumLineSpacing = 0.0
            let margin = HCBoutiqueIndexCell.itemMargin()
            self.sectionInset = UIEdgeInsetsMake(0, margin * 1.5, 0, margin * 1.5)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
