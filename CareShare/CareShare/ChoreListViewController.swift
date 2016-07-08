//
//  ChoreListViewController.swift
//  CareShare
//
//  Created by Jessica Malesh on 7/7/16.
//  Copyright © 2016 Jess Malesh. All rights reserved.
//

import UIKit
import CoreData

class ChoreListViewController: UITableViewController
{

    @IBAction func addChore(sender: AnyObject)
    {
        let alert = UIAlertController(title: "Save", message: "Add a new chore", preferredStyle: .Alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .Default, handler: { (action: UIAlertAction) -> Void in
            
            let textField = alert.textFields!.first
            self.saveChore(textField!.text!)
            self.choreTableView.reloadData()
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default) { (action: UIAlertAction) -> Void in
        }
        
        alert.addTextFieldWithConfigurationHandler
        {
            (textField: UITextField) -> Void in
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBOutlet var choreTableView: UITableView!
    
    var choreList = [NSManagedObject]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        title = "Chore List"
        choreTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")

    }
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Chores")
        
        do {
            let results = try managedContext.executeFetchRequest(fetchRequest)
            choreList = results as! [NSManagedObject]
        } catch let error as NSError {
            print("could not fetch \(error), \(error.userInfo)")
        }
    }
    
    func saveChore(chore: String!)
    {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        let entity = NSEntityDescription.entityForName("Chores", inManagedObjectContext: managedContext)
        let action = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        action.setValue(chore, forKey: "chore")
        
        do {
            try managedContext.save()
            
            choreList.append(action)
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
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
        return choreList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")
        let action = choreList[indexPath.row]
        
        cell!.textLabel!.text = action.valueForKey("chore") as! String
        
        return cell!
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
