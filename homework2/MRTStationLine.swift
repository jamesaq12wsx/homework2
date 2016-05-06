//
//  MRTStationLine.swift
//  homework2
//
//  Created by 林紹瑾 on 2016/5/5.
//  Copyright © 2016年 林紹瑾. All rights reserved.
//

import Foundation

class MRTStationLine {
    var name:String?
    var lineStations:[MRTStation]?
    
    init(name:String){
        self.name = name
        self.lineStations = []
    }
}