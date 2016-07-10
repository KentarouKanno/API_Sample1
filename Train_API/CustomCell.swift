//
//  CustomCell.swift
//  Train_API
//
//  Created by Kentarou on 2016/07/09.
//  Copyright © 2016年 Kentarou. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel       : UILabel!
    @IBOutlet weak var xLabel          : UILabel!
    @IBOutlet weak var yLabel          : UILabel!
    @IBOutlet weak var prevStationLabel: UILabel!
    @IBOutlet weak var nextStationLabel: UILabel!

    var stationData: StationModel! {
        didSet {
            nameLabel.text        = "駅名 : " + stationData.name
            xLabel.text           = "緯度 : " + String(stationData.x)
            yLabel.text           = "経度 : " + String(stationData.y)
            prevStationLabel.text = "前駅 : " + (stationData.prev ?? "なし")
            nextStationLabel.text = "次駅 : " + (stationData.next ?? "なし")
        }
    }
}
