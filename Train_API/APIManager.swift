//
//  APIManager.swift
//  Train_API
//
//  Created by Kentarou on 2016/07/10.
//  Copyright © 2016年 Kentarou. All rights reserved.
//

import Foundation

class APIManager {
    
    var stationDataArray: Array<StationModel> = []

    func getStationData(searchText: String, closure: Array<StationModel> -> Void)  {
        
        // let query: String = "JR山手線"
        let encodedQuery: String = searchText.stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet())!
        let url = NSURL(string: "http://express.heartrails.com/api/json?method=getStations&line=" + encodedQuery)!
        let request = NSURLRequest(URL: url)
        
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: config, delegate: nil, delegateQueue: NSOperationQueue.mainQueue())
        
        let task = session.dataTaskWithRequest(request) { data, response, error in
            
            // メインスレッドで実行される
            if let _ = response, data = data {
                
                do {
                    // JSONをNSDictionaryに変換
                    let jsonDic = try NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers) as! NSDictionary
                    
                    print(jsonDic)
                    
                    if let dictData = jsonDic["response"] as? NSDictionary {
                        if let arrayData = dictData["station"] as? NSArray {
                            for stationObj in arrayData {
                                
                                self.stationDataArray.append(StationModel(dataDict: stationObj as! NSDictionary))
                            }
                        }
                    }
                    
                    closure(self.stationDataArray)
                    print(self.stationDataArray)
                    
                } catch {
                    // JSONパースエラー
                    closure(self.stationDataArray)
                    print("JSONパースエラー: \(error)")
                }
                
            } else {
                // 通信エラー
                closure(self.stationDataArray)
                print("通信エラー:",error)
            }
        }
        
        task.resume()
    }
}