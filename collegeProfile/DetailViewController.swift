//
//  DetailViewController.swift
//  collegeProfile
//
//  Created by Alumme on 1/26/16.
//  Copyright © 2016 Alumme. All rights reserved.
//

import UIKit
import SafariServices

class DetailViewController: UIViewController, SFSafariViewControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    
    @IBOutlet weak var collegeImage: UIImageView!
    
    @IBOutlet weak var nameText: UITextField!

    @IBOutlet weak var locationText: UITextField!
    
    @IBOutlet weak var populationText: UITextField!

    @IBOutlet weak var websiteLink: UITextField!
    
    var college : CollegeClass!
    var myImagePicker = UIImagePickerController()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        collegeImage.image = college.image
        nameText.text = college.name
        locationText.text = college.location
        populationText.text = String(college.students)
        websiteLink.text = college.link
        myImagePicker.delegate = self
        myImagePicker.allowsEditing = true
        
        


    }


    @IBAction func saveButtonTapped(sender: UIButton)
    {
        college.name = nameText.text!
        college.location = locationText.text!
        college.students = Int(populationText.text!)!
        college.link = websiteLink.text!
    }
    
    
    @IBAction func imageTapped(sender: UITapGestureRecognizer)
    {
        let mySheet = UIAlertController(title: "", message: nil , preferredStyle: UIAlertControllerStyle.ActionSheet)
        mySheet.addAction(UIAlertAction(title: "Camera", style: .Default, handler: { (cameraAction) -> Void in
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)
            {
                self.myImagePicker.sourceType = UIImagePickerControllerSourceType.Camera
                self.presentViewController(self.myImagePicker, animated: true, completion: nil)
            }
        }))
        mySheet.addAction(UIAlertAction(title: "Photo Library", style: .Default, handler: { (libraryAction) -> Void in
            self.myImagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            self.presentViewController(self.myImagePicker, animated: true , completion: nil)
        }))
        self.presentViewController(myImagePicker, animated: true, completion: nil)
        
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        myImagePicker.dismissViewControllerAnimated(true) { () -> Void in
            let selectedPic = info[UIImagePickerControllerOriginalImage] as! UIImage
            self.collegeImage.image = selectedPic
        }
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
