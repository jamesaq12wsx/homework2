//
//  MRTTwoLineDetailViewController.swift
//  homework2
//
//  Created by 林紹瑾 on 2016/5/6.
//  Copyright © 2016年 林紹瑾. All rights reserved.
//

import UIKit

class MRTTwoLineDetailViewController: UIViewController {

    @IBOutlet weak var mrtStationNameLabel: UILabel!
    @IBOutlet weak var mrtStationFirstLineLabel: UILabel!
    @IBOutlet weak var mrtStationSecondLineLabel: UILabel!
    
    var mrtStation:MRTStation?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        mrtStationNameLabel.text = mrtStation!.name
        var count = 1
        for (lineName, lineCode) in mrtStation!.line! {
            if count == 1 {
                mrtStationFirstLineLabel.text = lineCode
                let (r,g,b) = MRTStationLineColor().lineColor[lineName]!
                mrtStationFirstLineLabel.backgroundColor = UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1.0)
                count += 1
            } else if count == 2{
                mrtStationSecondLineLabel.text = lineCode
                let (r,g,b) = MRTStationLineColor().lineColor[lineName]!
                mrtStationSecondLineLabel.backgroundColor = UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1.0)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
