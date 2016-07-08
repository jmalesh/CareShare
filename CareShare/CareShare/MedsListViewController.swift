//
//  MedsListViewController.swift
//  CareShare
//
//  Created by Jess Malesh on 7/6/16.
//  Copyright © 2016 Jess Malesh. All rights reserved.
//

import UIKit

class MedsListViewController: UITableViewController, Identity, UIViewControllerTransitioningDelegate
{
    var medications: [MedListItem] = medicationSample
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return medications.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MedicationCell", forIndexPath: indexPath)
        
        let medication = medications[indexPath.row] as MedListItem
        cell.textLabel?.text = medication.title
        cell.detailTextLabel?.text = medication.dosage
        
        
        return cell
    }
    
    @IBAction func cancelToMedsListViewController(segue: UIStoryboardSegue)
    {
        
    }
    
    @IBAction func saveMedicationDetail(segue: UIStoryboardSegue)
    {
        if let medicationDetailsViewController = segue.sourceViewController as? MedicationDetailsViewController {
            if let medication = medicationDetailsViewController.medication{
                medications.append(medication)
                
                let indexPath = NSIndexPath(forRow: medications.count-1, inSection: 0)
                tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            }
        }
    }
}









//    @IBOutlet weak var medsTableView: UITableView!
//
//    
//    var medListItems: [MedListItem] = medicationSample
//    
//    
//    override func viewDidLoad()
//    {
//        super.viewDidLoad()
//        self.setupTableView()
////        medsTableView.registerClass(TableViewCell.self, forCellReuseIdentifier: "MedicationCell")
//        
//        if medListItems.count > 0 {
//            return
//        }
//        
//        
//        
//    }
//    
//    func setupTableView()
//    {
////        self.medsTableView.estimatedRowHeight = 100
////        self.medsTableView.rowHeight = UITableViewAutomaticDimension
////        self.medsTableView.delegate = self
////        self.medsTableView.dataSource = self
////        self.medsTableView.registerClass(TableViewCell.self, forCellReuseIdentifier: "cell")
////        self.medsTableView.backgroundColor = UIColor.blackColor()
////    
//        
//    }
//    
//    func medListItemDeleted(medListItem: MedListItem)
//    {
//        let index = (medListItems as NSArray).indexOfObject(medListItem)
//        if index == NSNotFound { return }
//        
//        medListItems.removeAtIndex(index)
//        
//        medsTableView.beginUpdates()
//        let indexPathForRow = NSIndexPath(forRow: index, inSection: 0)
//        medsTableView.deleteRowsAtIndexPaths([indexPathForRow], withRowAnimation: .Fade)
//        medsTableView.endUpdates()
//    }
//    
//    override func didReceiveMemoryWarning()
//    {
//        super.didReceiveMemoryWarning()
//        
//    }
//    
//    @IBAction func cancelToNewMemberViewController(segue: UIStoryboardSegue)
//    {
//        
//    }
//   
//    
//    
//    
//}
//
//extension MedsListViewController: TableViewCellDelegate
//{
//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
//    {
//        return 1
//    }
//    
//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
//    {
//        return self.medListItems.count
//    }
//    
//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
//    {
//        let cell = medsTableView.dequeueReusableCellWithIdentifier("MedicationCell", forIndexPath: indexPath) as! TableViewCell
//        let item = medListItems[indexPath.row]
//        cell.textLabel?.backgroundColor = UIColor.clearColor()
//        cell.textLabel?.text = item.title
//        cell.detailTextLabel?.text = item.dosage
//        cell.selectionStyle = .None
//        cell.delegate = self
//        cell.medListItem = item
//        
//        return cell
//    }
//    
////    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//////        return medsTableView.rowHeight;
////    }
//   
//    //adding color to background
//    func colorForIndex(index: Int) -> UIColor
//    {
//        let itemCount = medListItems.count - 1
//        let val = (CGFloat(index) / CGFloat(itemCount)) * 0.6
//        return UIColor(red: 0.0, green: val, blue: 15.0, alpha: 5.0)
//    }
//    
//    
//    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath)
//    {
//        cell.backgroundColor = colorForIndex(indexPath.row)
//    }
//    
//    }
