//
//  ViewController.swift
//  collegeProfile
//
//  Created by Alumme on 1/20/16.
//  Copyright © 2016 Alumme. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{


    @IBOutlet weak var myTableView: UITableView!
    

    
    var colleges : [CollegeClass] = []
    
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        myTableView.dataSource = self
        myTableView.delegate = self
        editButton.tag = 0
        colleges.append(CollegeClass(Name: "Stanford University", Location: "Stanford, California", Image: UIImage(named: "stanford")!, numberOfStudents: 16136, Link: "https://www.stanford.edu/"))
        colleges.append(CollegeClass(Name: "Indiana University", Location: "Bloomington, Indiana", Image: UIImage(named: "Indiana")!, numberOfStudents: 48514, Link: "https://www.indiana.edu/"))
        colleges.append(CollegeClass(Name: "University of Wisconsin", Location: "Madison, Wisconsin", Image: UIImage(named: "wisconsin")!, numberOfStudents: 43193, Link: "http://www.wisc.edu/"))
        
        
    }
    
    
    
    
    @IBAction func addButtonTapped(sender: UIBarButtonItem)
    {
        let myAlert = UIAlertController(title: "Add College", message: nil, preferredStyle: .Alert)
        myAlert.addTextFieldWithConfigurationHandler { (nameTextField) -> Void in
            nameTextField.placeholder = "Add college name here"
        }
        myAlert.addTextFieldWithConfigurationHandler { (locationTextField) -> Void in
            locationTextField.placeholder = "Add location here"
        }
        myAlert.addTextFieldWithConfigurationHandler { (populationTextField) -> Void in
            populationTextField.placeholder = "Add population here"
        }
        myAlert.addTextFieldWithConfigurationHandler { (linkTextField) -> Void in
            linkTextField.placeholder = "Add link here"
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        myAlert.addAction(cancelAction)
        let addAction = UIAlertAction(title: "Add", style: .Default) { (addAction) -> Void in
            let nameTF = myAlert.textFields![0] as UITextField
            let locationTF = myAlert.textFields![1] as UITextField
            let populationTF =  myAlert.textFields![2] as UITextField
            let linkTF = myAlert.textFields![3] as UITextField
            self.colleges.append(CollegeClass(Name: nameTF.text!, Location: locationTF.text!, numberOfStudents: Int(populationTF.text!)!))
            self.myTableView.reloadData()
        }
        myAlert.addAction(addAction)
        //presents alert view
        self.presentViewController(myAlert, animated: true, completion: nil)
    }
    
    
    @IBAction func editButtonTapped(sender: UIBarButtonItem)
    {
        if editButton.tag == 0
        {
            myTableView.editing = true
            editButton.tag = 1
        }
        else
        {
            myTableView.editing = false
            editButton.tag = 0
        }
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == .Delete
        {
            colleges.removeAtIndex(indexPath.row)
            myTableView.reloadData()
        }
    
        
    }
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        return true
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath)
    {
        let college = colleges[sourceIndexPath.row]
        colleges.removeAtIndex(sourceIndexPath.row)
        colleges.insert(college, atIndex: destinationIndexPath.row)
    }
    
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let myCell = myTableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        myCell.textLabel?.text = colleges[indexPath.row].name
        myCell.detailTextLabel?.text = colleges[indexPath.row].location
        return myCell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return colleges.count
    }
    
    override func viewWillAppear(animated: Bool)
    {
        myTableView.reloadData()
    }
    
    
    
 
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let detailView = segue.destinationViewController as! DetailViewController
        let selectedRow = myTableView.indexPathForSelectedRow?.row
        detailView.college = colleges[selectedRow!]
    }



}

