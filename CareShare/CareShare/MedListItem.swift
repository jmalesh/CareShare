//
//  MedListItem.swift
//  CareShare
//
//  Created by Jess Malesh on 7/5/16.
//  Copyright © 2016 Jess Malesh. All rights reserved.
//

import UIKit

class MedListItem: NSObject
{
    var title: String?
    var dosage: String?
    var frequency: String?
    
    init(title: String?, dosage: String?, frequency: String?)
    {
        self.title = title
        self.dosage = dosage
        self.frequency = frequency
    }

}
