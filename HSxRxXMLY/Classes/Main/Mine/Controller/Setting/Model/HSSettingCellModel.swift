//
//  HSSettingCellModel.swift
//  HSxRxXMLY
//
//  Created by emily on 2018/6/13.
//  Copyright © 2018年 emily. All rights reserved.
//

import UIKit

public enum HSSettingCellType {
    case normal   // 正常
    case rightRecordButton  // 右侧录音
    case rightSwitch(isOn: Bool)  // 右侧开关
    case rightTextLabel  // 右侧文本
}

// MARK:- 设置单元格 数据模型
public struct HSSettingCellModel {
    var leftIcon:String?
    var title:String?
    var description: String?
    var dotIcon: String?
    var rightIcon: String?
    
    var isHiddenBottomLine: Bool = false
    var cellType:HSSettingCellType = .normal
    
    init() {
        
    }
    
    init(leftIcon: String?, title: String?, description: String?, dotIcon: String?, rightIcon: String?) {
        self.leftIcon = leftIcon
        self.title = title
        self.description = description
        self.rightIcon = rightIcon
        self.dotIcon = dotIcon
    }
    
    init(leftIcon: String?, title: String?, description: String?, dotIcon: String?, rightIcon: String?, isHiddenBottomLine: Bool) {
        self.leftIcon = leftIcon
        self.title = title
        self.description = description
        self.rightIcon = rightIcon
        self.dotIcon = dotIcon
        
        self.isHiddenBottomLine = isHiddenBottomLine
    }
    init(leftIcon: String?, title: String?, description: String?, dotIcon: String?, rightIcon: String?, isHiddenBottomLine: Bool, cellType: HSSettingCellType) {
        self.leftIcon = leftIcon
        self.title = title
        self.description = description
        self.rightIcon = rightIcon
        self.dotIcon = dotIcon
        
        self.isHiddenBottomLine = isHiddenBottomLine
        self.cellType = cellType
    }
}
