//
//  MRTDetailViewController.swift
//  homework2
//
//  Created by 林紹瑾 on 2016/5/1.
//  Copyright © 2016年 林紹瑾. All rights reserved.
//

import UIKit

class MRTDetailViewController: UIViewController {

    @IBOutlet var mrtStationNameLabel: UILabel!
    @IBOutlet var mrtStationFirstLineLabel: UILabel!
    
    var mrtStation:MRTStation?
//    var mrtStationName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        mrtStationNameLabel.text = mrtStation?.name
        for (lineName, lineCode) in mrtStation!.line! {
            mrtStationFirstLineLabel.text = lineCode
            let (r,g,b) = MRTStationLineColor().lineColor[lineName]!
            mrtStationFirstLineLabel.backgroundColor = UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1.0)
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
