//
//  ViewController.swift
//  Train_API
//
//  Created by Kentarou on 2016/07/09.
//  Copyright © 2016年 Kentarou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // UI Parts
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    // Datas
    var stationDataArray: Array<StationModel> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 20
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    
    @IBAction func pushSearchButton(sender: AnyObject) {
        
        textField.resignFirstResponder()
        
        // API Access
        APIManager().getStationData(textField.text!) { (stationDatas) in
            if !stationDatas.isEmpty {
                self.stationDataArray = stationDatas
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - TableView Delegate & DataSource
    
    // Row Count
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stationDataArray.count
    }
    
    // Generate Cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CustomCell", forIndexPath: indexPath) as! CustomCell
        cell.stationData = stationDataArray[indexPath.row]
        return cell
    }

}

