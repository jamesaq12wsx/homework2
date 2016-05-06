//
//  MRTTableViewController.swift
//  homework2
//
//  Created by 林紹瑾 on 2016/4/30.
//  Copyright © 2016年 林紹瑾. All rights reserved.
//

import UIKit

class MRTTableViewController: UITableViewController {
    
    var mrtStations:[MRTStation] = []
    var mrtArray:[[String: AnyObject]] = []
    var mrtLines:[String:[MRTStation]] = [:]
    var mrtLinesNumber:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        let mrtUrl = NSBundle.mainBundle().URLForResource("MRT", withExtension: "json")
        let mrtData = NSData(contentsOfURL: mrtUrl!)
//        let object = try NSJSONSerialization.JSONObjectWithData(mrtData!, options: .AllowFragments)
//        let dictionary = object as? [[String:AnyObject]]
        do {
            let object = try NSJSONSerialization.JSONObjectWithData(mrtData!, options: .AllowFragments)
            if let dictionary = object as? [[String: AnyObject]] {
                readMrtJSONObject(dictionary)
            }
        } catch {
            // Handle Error
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return mrtLinesNumber[section]
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return (mrtLines.count)
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let mrtLine = mrtLines[mrtLinesNumber[section]]
        return mrtLine!.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cellIdentifier = "Cell"
//        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)  as! MRTTableViewCell

        // Configure the cell...
        let mrtLine = mrtLines[mrtLinesNumber[indexPath.section]]
        let mrtStation = mrtLine![indexPath.row]
        if mrtStation.line?.count == 1 {
            let cellIdentifier = "OneLineCell"
            let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)  as! MRTTableViewCell
            cell.mrtStationNameLabel.text = mrtStation.name
            for (lineName, lineCode) in mrtStation.line! {
                cell.mrtStationFirstLineLabel.text = lineCode
                let (r,g,b) = MRTStationLineColor().lineColor[lineName]!
                cell.mrtStationFirstLineLabel.backgroundColor = UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1.0)
                cell.mrtStationFirstLineLabel.layer.cornerRadius = 5
            }
//            return cell
            return cell
        } else {
            let cellIdentifier = "TwoLineCell"
            let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! MRTTwoLineStationTableViewCell
            cell.mrtStationNameLabel.text = mrtStation.name
            var count = 1
            for (lineName, lineCode) in mrtStation.line! {
                if count == 1 {
                    cell.mrtStationFirstLineLabel.text = lineCode
                    let (r,g,b) = MRTStationLineColor().lineColor[lineName]!
                    cell.mrtStationFirstLineLabel.backgroundColor = UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1.0)
                    count += 1
                } else if count == 2{
                    cell.mrtStationSecondLineLabel.text = lineCode
                    let (r,g,b) = MRTStationLineColor().lineColor[lineName]!
                    cell.mrtStationSecondLineLabel.backgroundColor = UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1.0)
                }
            }
            return cell
        }
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showStationDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destinationViewController as! MRTDetailViewController
                let mrtLine = mrtLines[mrtLinesNumber[indexPath.section]]
                let mrtStation = mrtLine![indexPath.row]
                destinationController.mrtStation = mrtStation
            }
        } else if segue.identifier == "showTwoLineStationDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destinationViewController as! MRTTwoLineDetailViewController
                let mrtLine = mrtLines[mrtLinesNumber[indexPath.section]]
                let mrtStation = mrtLine![indexPath.row]
                destinationController.mrtStation = mrtStation
            }
        }
    }
 
    
    func readMrtJSONObject(object: [[String: AnyObject]]) {
        let mrtStas = object
        for mrtSta in mrtStas {
            guard let name = mrtSta["name"] as? String, let coordinate = mrtSta["coordinate"] as? [Float], let lines = mrtSta["lines"] as? [String: String] else {break}
            let newMrtStation = MRTStation(name: name,line: lines,coordinate: coordinate)
            for (lineName,_) in lines {
                if mrtLines[lineName] == nil {
//                  let newMrtLine = [newMrtStation]
                    mrtLines[lineName] = [newMrtStation]
//                  mrtLines![lineName]?.append(newMrtStation)
                    mrtLinesNumber.append(lineName)
                }else {
                    mrtLines[lineName]?.append(newMrtStation)
                }
            }
            mrtStations.append(newMrtStation)
        }
    }


}
