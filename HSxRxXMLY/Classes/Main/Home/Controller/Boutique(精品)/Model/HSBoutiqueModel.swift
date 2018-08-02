//
//  HSBoutiqueModel.swift
//  HSxRxXMLY
//
//  Created by emily on 2018/8/2.
//  Copyright © 2018年 emily. All rights reserved.
//

import Foundation
import ObjectMapper

struct HSBoutiqueModel: Mappable {
    init?(map: Map) {
        
    }
    
    var ret = 0
    var hasRecommendedZones = false
    var msg = "成功"
    var serverMilliseconds: UInt32 = 0
    
//    var keywordList: [HSKeywardsModel]?
//    var squareList: [HCSquareModel]?
//    var focusList: [HCFocusModel]?
//    var categoryList: [HCCategoryModel]?
    
    mutating func mapping(map: Map) {
        ret <- map["ret"]
        hasRecommendedZones <- map["hasRecommendedZones"]
        msg <- map["msg"]
        serverMilliseconds <- map["serverMilliseconds"]
        
//        keywordList <- map["keywords.list"]
//        categoryList <- map["categoryContents.list"]
//        squareList <- map["categoryContents.list.3.list"]
//        focusList <- map["focusImages.data"]
    }
    

    

}
