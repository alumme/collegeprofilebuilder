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
    var link = ""
    
    init(Name: String, Location: String, Image: UIImage, numberOfStudents: Int, Link: String)
    {
        super.init()
        name = Name
        location = Location
        image = Image
        students = numberOfStudents
        link = Link 
    }
    
    init(Name: String, Location: String, numberOfStudents: Int)
    {
        name = Name
        location = Location
        students = numberOfStudents
    }
}
