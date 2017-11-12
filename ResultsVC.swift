//
//  ResultsVC.swift
//  Mampf
//
//  Created by Schule on 03.11.17.
//  Copyright © 2017 Arlette Hugi. All rights reserved.
//

import UIKit
import Firebase

class ResultsVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var ref : DatabaseReference!
    var Handle:DatabaseHandle?
    
    var eateryData = [Eatery]()
    
    @IBOutlet weak var TableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TableView.delegate = self
        TableView.dataSource = self
        
        ref = Database.database().reference()
        
        //Take value from snapshot and add it to the eateryData Array
        
        self.ref.child("Eateries").observe(.childAdded, with: { (snapshot) in
            let dataChange = snapshot.value as? [String: AnyObject]
            let aRequest = Eatery(aDict: dataChange!)
            self.eateryData.append(aRequest)
            
            //Updates the table to show the data
             self.TableView.reloadData()
            
        })
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return eateryData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
      
    // Links the cell on the ResultsVC to the data from the eateryData array.
    // If a new cell or text field added you would need to add  cell.textLabel?.text = eateryData[indexPath.row].thenewitemyouadded as an example
      cell.textLabel?.text = eateryData[indexPath.row].Name
        return cell
    }


}
