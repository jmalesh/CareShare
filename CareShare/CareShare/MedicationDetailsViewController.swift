//
//  MedicationDetailsViewController.swift
//  CareShare
//
//  Created by Jessica Malesh on 7/6/16.
//  Copyright © 2016 Jess Malesh. All rights reserved.
//

import UIKit

class MedicationDetailsViewController: UITableViewController {

    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var dosageLabel: UILabel!
    
    var frequency: String = "Other" {
        didSet {
            dosageLabel.text? = frequency
        }
    }
    
    @IBAction func unwindWithSelectedFrequency(segue: UIStoryboardSegue) {
        if let frequencyPickerViewController = segue.sourceViewController as? FrequencyPickerViewController,
            selectedFrequency = frequencyPickerViewController.selectedFrequency {
                frequency = selectedFrequency
            }
        
    }
    
    var medication: MedListItem?
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

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath == 0{
            titleTextField.becomeFirstResponder()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SaveMedicationDetail"
        {
            medication = MedListItem(title: titleTextField.text!, dosage: frequency, frequency: frequency)
        }
        
        if segue.identifier == "PickFrequency" {
            if let frequencyPickerViewController = segue.destinationViewController as? FrequencyPickerViewController {
                frequencyPickerViewController.selectedFrequency = frequency
            }
        }
    }
    
    
    // MARK: - Table view data source

    
}
