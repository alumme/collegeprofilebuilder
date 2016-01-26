//
//  CollegeClass.swift
//  collegeProfile
//
//  Created by Alumme on 1/20/16.
//  Copyright © 2016 Alumme. All rights reserved.
//

import UIKit

class CollegeClass: NSObject
{

    var name = ""
    var location = ""
    var image = UIImage(named: "default")
    var students = 0
    
    init(Name: String, Location: String, Image: UIImage, numberOfStudents: Int)
    {
        super.init()
        name = Name
        location = Location
        image = Image
        students = numberOfStudents
    }
    
    init(Name: String, Location: String)
    {
        super.init()
        name = Name
        location = Location
    }
}
