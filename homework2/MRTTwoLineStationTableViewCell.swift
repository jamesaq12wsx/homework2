//
//  TwoLineStationTableViewCell.swift
//  homework2
//
//  Created by 林紹瑾 on 2016/5/6.
//  Copyright © 2016年 林紹瑾. All rights reserved.
//

import UIKit

class MRTTwoLineStationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mrtStationNameLabel: UILabel!
    @IBOutlet weak var mrtStationFirstLineLabel: UILabel!
    @IBOutlet weak var mrtStationSecondLineLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
