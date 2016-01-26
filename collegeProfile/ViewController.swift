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
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        myTableView.dataSource = self
        myTableView.delegate = self
        colleges.append(CollegeClass(Name: "Stanford University", Location: "Stanford, California", Image: UIImage(named: "stanford")!, numberOfStudents: 16136))
        colleges.append(CollegeClass(Name: "Indiana University", Location: "Bloomington, Indiana", Image: UIImage(named: "Indiana")!, numberOfStudents: 48514))
        colleges.append(CollegeClass(Name: "University of Wisconsin", Location: "Madison, Wisconsin", Image: UIImage(named: "wisconsin")!, numberOfStudents: 43193))
        
        
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
    
    
    
 
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let detailView = segue.destinationViewController as! DetailViewController
        let selectedRow = myTableView.indexPathForSelectedRow?.row
        detailView.college = colleges[selectedRow!]
    }



}

