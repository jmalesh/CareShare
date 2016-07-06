//
//  ListViewController.swift
//  CareShare
//
//  Created by Jessica Malesh on 6/30/16.
//  Copyright © 2016 Jess Malesh. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, Identity, UIViewControllerTransitioningDelegate
{

    @IBOutlet weak var medsTableView: UITableView!
    
    var medListItems = [MedListItem]()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.setupTableView()
        
        if medListItems.count > 0 {
            return
        }
        medListItems.append(MedListItem(text: "testing"))
        medListItems.append(MedListItem(text: "testing number 2"))
        
       

        
    }
    
    func setupTableView()
    {
        self.medsTableView.estimatedRowHeight = 100
        self.medsTableView.rowHeight = UITableViewAutomaticDimension
        self.medsTableView.delegate = self
        self.medsTableView.dataSource = self
        self.medsTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }


    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        
    }
    
        

}

extension ListViewController: UITableViewDataSource
{
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.medListItems.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = medsTableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        let item = medListItems[indexPath.row]
        cell.textLabel?.text = item.text
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return medsTableView.rowHeight;
    }

   

}
