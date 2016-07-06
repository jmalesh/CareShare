//
//  Identity.swift
//  CareShare
//
//  Created by Jessica Malesh on 7/5/16.
//  Copyright © 2016 Jess Malesh. All rights reserved.
//

import Foundation

protocol Identity {
    static func id() -> String
}

extension Identity
{
    static func id() -> String
    {
        return String(self)
    }
}
