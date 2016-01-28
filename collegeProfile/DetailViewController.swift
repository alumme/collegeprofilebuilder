//
//  DetailViewController.swift
//  collegeProfile
//
//  Created by Alumme on 1/26/16.
//  Copyright © 2016 Alumme. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController
{
    
    @IBOutlet weak var collegeImage: UIImageView!
    
    @IBOutlet weak var nameText: UITextField!

    @IBOutlet weak var locationText: UITextField!
    
    @IBOutlet weak var populationText: UITextField!
    
    var college : CollegeClass!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        collegeImage.image = college.image
        nameText.text = college.name
        locationText.text = college.location
        populationText.text = String(college.students)


    }


    @IBAction func saveButtonTapped(sender: UIButton)
    {
        college.name = nameText.text!
        college.location = locationText.text!
        college.students = Int(populationText.text!)!
    }
    



}
