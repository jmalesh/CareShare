//
//  ViewController.swift
//  CareShare
//
//  Created by Jess Malesh on 6/30/16.
//  Copyright © 2016 Jess Malesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var loginButton: UIImageView!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.setupAppearance()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        
    }
    
    
    func setupAppearance()
    {
        self.loginButton.layer.cornerRadius = 60.0
        
    }


    func configureButton()
    {
        loginButton.layer.cornerRadius = 0.5 * loginButton.bounds.size.width
        loginButton.layer.borderColor = UIColor.blackColor().CGColor
        //        (red:0.0/255.0, green:122.0/255.0, blue:255.0/255.0, alpha:1).CGColor as CGColorRef
        loginButton.layer.borderWidth = 2.0
        loginButton.clipsToBounds = true
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.configureButton()
    }


}

