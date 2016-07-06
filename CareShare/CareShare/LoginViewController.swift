//
//  LoginViewController.swift
//  CareShare
//
//  Created by Jess Malesh on 7/5/16.
//  Copyright © 2016 Jess Malesh. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIViewControllerTransitioningDelegate, Identity
{
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        

        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    
    
    @IBAction func newMemberButtonSelected(sender: AnyObject)
    {
        self.performSegueWithIdentifier(NewMemberViewController.id(), sender: nil)
        
    }

    
    // MARK: - Navigation
}

extension LoginViewController
{
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == NewMemberViewController.id()
        {
            if let newMemberViewController = segue.destinationViewController as? NewMemberViewController {
                
                newMemberViewController.transitioningDelegate = self
            }
        }
    }

}


    
    
 


