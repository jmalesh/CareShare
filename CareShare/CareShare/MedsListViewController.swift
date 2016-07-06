//
//  MedsListViewController.swift
//  CareShare
//
//  Created by Jess Malesh on 7/6/16.
//  Copyright © 2016 Jess Malesh. All rights reserved.
//

import UIKit

class MedsListViewController: UIViewController, Identity, UIViewControllerTransitioningDelegate, UITableViewDelegate
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
//        self.medsTableView.estimatedRowHeight = 100
        self.medsTableView.rowHeight = UITableViewAutomaticDimension
        self.medsTableView.delegate = self
        self.medsTableView.dataSource = self
        self.medsTableView.registerClass(TableViewCell.self, forCellReuseIdentifier: "cell")
        
    }
    
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        
    }
    
    
    
}

extension MedsListViewController: UITableViewDataSource
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
        cell.textLabel?.backgroundColor = UIColor.clearColor()
        cell.textLabel?.text = item.text
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return medsTableView.rowHeight;
    }
   
    //adding color to background
    func colorForIndex(index: Int) -> UIColor
    {
        let itemCount = medListItems.count - 1
        let val = (CGFloat(index) / CGFloat(itemCount)) * 0.6
        return UIColor(red: 0.0, green: val, blue: 15.0, alpha: 5.0)
    }
    
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath)
    {
        cell.backgroundColor = colorForIndex(indexPath.row)
    }
}
