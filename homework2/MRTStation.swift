//
//  MRTStation.swift
//  homework2
//
//  Created by 林紹瑾 on 2016/4/30.
//  Copyright © 2016年 林紹瑾. All rights reserved.
//

import Foundation

class MRTStation {
    var name:String?
    var line:[String:String]?
    var coordinate:[Float]?
    
    init(name:String, line:[String:String], coordinate:[Float]){
        self.name = name
        self.line = line
        self.coordinate = coordinate
    }
}