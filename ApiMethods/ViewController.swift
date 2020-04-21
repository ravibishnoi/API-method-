//
//  ViewController.swift
//  ApiMethods
//
//  Created by AshutoshD on 07/04/20.
//  Copyright © 2020 ravindraB. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    var CityArr = NSArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        ApiMethod()
        tblView.reloadData()
        
    }

    
    func ApiMethod() {
        let url = "http://13.57.238.187/ak/360legalforms_api_qa/public/api/v1/states"
        let headers: HTTPHeaders = [
        "Secure-Key": "20dcc7ec-7387-44b6-abeb-7d116c214417",
        "Accept": "application/json"
        ]
    
        Alamofire.request(url, headers: headers)
        .responseJSON {  response in
        debugPrint(response)
            if let json = response.value {
                print("JSON: \(json)")// serialized json response after post
                
                let jsonDict = json as? NSDictionary
                
              let data  = jsonDict?["data"] as! NSDictionary
                let cities  = data["state"] as! NSArray
                self.CityArr = data["state"] as! NSArray
                print("Cities :\(cities)")
                 print("data :\(data)")
                self.tblView.reloadData()
            }
        }

    }
    
    
}

extension  ViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CityArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblView.dequeueReusableCell(withIdentifier: "DataTableCell", for: indexPath) as! DataTableCell
        
        let dataArr = CityArr[indexPath.row] as! NSDictionary
        
        let id = dataArr.value(forKey: "id") as! NSNumber
        
        cell.lblID.text = id.stringValue
        cell.lblName.text = dataArr.value(forKey: "name") as! String
        cell.lblAbbr.text = dataArr.value(forKey: "abbr") as! String
        
        return cell
    }
    
    
}

