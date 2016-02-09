//
//  DetailViewController.swift
//  collegeProfile
//
//  Created by Alumme on 1/26/16.
//  Copyright © 2016 Alumme. All rights reserved.
//

import UIKit
import SafariServices

class DetailViewController: UIViewController, SFSafariViewControllerDelegate
{
    
    @IBOutlet weak var collegeImage: UIImageView!
    
    @IBOutlet weak var nameText: UITextField!

    @IBOutlet weak var locationText: UITextField!
    
    @IBOutlet weak var populationText: UITextField!
    

    @IBOutlet weak var websiteLink: UITextField!
    
    var college : CollegeClass!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        collegeImage.image = college.image
        nameText.text = college.name
        locationText.text = college.location
        populationText.text = String(college.students)
        websiteLink.text = college.link


    }


    @IBAction func saveButtonTapped(sender: UIButton)
    {
        college.name = nameText.text!
        college.location = locationText.text!
        college.students = Int(populationText.text!)!
    }
    
    
    @IBAction func websiteButtonTapped(sender: UIButton) {
        var url = NSURL(string: college.link)
        var svc = SFSafariViewController(URL: url!)
        svc.delegate = self
        presentViewController(svc, animated: true, completion: nil)
    }
    
    func safariViewControllerDidFinish(controller: SFSafariViewController) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
    
    




}
