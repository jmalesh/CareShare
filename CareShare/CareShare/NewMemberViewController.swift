//
//  NewMemberViewController.swift
//  CareShare
//
//  Created by Jess Malesh on 7/5/16.
//  Copyright © 2016 Jess Malesh. All rights reserved.
//

import UIKit



class NewMemberViewController: UIViewController, Identity, UIViewControllerTransitioningDelegate
{
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        
    }
    
//    @IBAction func medicationListButtonSelected(sender: AnyObject)
//    {
//        self.performSegueWithIdentifier(MedsListViewController.id(), sender: nil)
//    }
    
    
    
  
    // MARK: - Navigation

}

extension NewMemberViewController 
{
   
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == MedsListViewController.id()
        {
            if let medsListViewController = segue.destinationViewController as? MedsListViewController {
                medsListViewController.transitioningDelegate = self
                            }
        }
    }

}





