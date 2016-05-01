//
//  MRTDetailViewController.swift
//  homework2
//
//  Created by 林紹瑾 on 2016/5/1.
//  Copyright © 2016年 林紹瑾. All rights reserved.
//

import UIKit

class MRTDetailViewController: UIViewController {

    @IBOutlet var MRTStationNameLabel: UILabel!
    var mrtStationName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        MRTStationNameLabel.text = mrtStationName
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
