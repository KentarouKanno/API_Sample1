//
//  SatationData.swift
//  Train_API
//
//  Created by Kentarou on 2016/07/09.
//  Copyright © 2016年 Kentarou. All rights reserved.
//

import Foundation

struct StationModel {
    
    var postal    : String
    var x         : Float
    var y         : Float
    var next      : String?
    var prev      : String?
    var line      : String
    var prefecture: String
    var name      : String
    
    init(dataDict: NSDictionary) {
        postal     = dataDict["postal"] as! String
        x          = dataDict["x"] as! Float
        y          = dataDict["y"] as! Float
        next       = dataDict["next"] as? String
        prev       = dataDict["prev"] as? String
        line       = dataDict["line"] as! String
        prefecture = dataDict["prefecture"] as! String
        name       = dataDict["name"] as! String
    }
}

