//
//  MedListItem.swift
//  CareShare
//
//  Created by Jessica Malesh on 7/5/16.
//  Copyright © 2016 Jess Malesh. All rights reserved.
//

import UIKit

class MedListItem: NSObject
{
    var text: String
    var completed: Bool
    
    init(text: String)
    {
        self.text = text
        self.completed = false
        
    }
    

}
