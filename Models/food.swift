//
//  food.swift
//  Mampf
//
//  Created by Rob Murray on 12/11/2017.
//  Copyright © 2017 Arlette Hugi. All rights reserved.
//

import Foundation
import Firebase

var budget: String = ""

class Eatery {
    
    //ToDo: Add all properties from JSON here. Important they are all the same case
    var Adresse: String = ""
    var Name: String = ""
    init(aDict: [String: AnyObject]) {
        self.Adresse = aDict["Adresse"] as! String
        self.Name = aDict["Name"] as! String
    }
    
    // All data is pulled into this to display
    var eateryData = [Eatery]()
}

struct Data {
    var bug: String = "a"
}
