//
//  Created by Schule on 03.11.17.
//  Copyright © 2017 Arlette Hugi. All rights reserved.
//

import UIKit
import Firebase

class FoodTypeVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var ref : DatabaseReference!
    var Handle:DatabaseHandle?
    // All data is pulled into this to display
    var eateryData = [Eatery]()
    var rob = "Pizza"
    @IBOutlet weak var TableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TableView.delegate = self
        TableView.dataSource = self
        
        ref = Database.database().reference()
        
        //Take value from snapshot and add it to the eateryData Array
 
      self.ref.child("Eateries").queryOrdered(byChild: "Name").queryEqual(toValue: "Mensa Stadi").observe(.childAdded, with: { (snapshot) in
     //   self.ref.child("Eateries").queryOrdered(byChild: "Food Groups").queryEqual(toValue: "Pizza").observe(.childAdded, with: { (snapshot) in

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
    
  /*  func findFood()-> Void {
        
        let ref = FIRDatabase.database().reference(fromURL: "https://jobsearch-ac777.firebaseio.com/jobs")
        ref.queryOrdered(byChild: "jobNumber").queryEqual(toValue: self.newjob).observe(.value, with: { snapshot in
            var newItems: [Job] = []
            
            for item in snapshot.children {
                let job = Job(snapshot: item as! FIRDataSnapshot)
                newItems.append(job)
                
            }
            
            self.jobNumber = (newItems.first?.jobNumber)!
            self.JobTitleDetail.text = newItems.first?.jobTitle
            self.JobDescDetail.text = newItems.first?.jobDescription
            self.applyLink = (newItems.first?.jobLink)!
            
        })
        
    */
    }
 
    


