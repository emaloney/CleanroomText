//
//  StringReplicateExtension.swift
//  Cleanroom Project
//
//  Created by Evan Maloney on 10/5/15.
//  Copyright © 2015 Gilt Groupe. All rights reserved.
//

import Foundation

extension String
{
    public func replicate(numberOfTimes: Int)
        -> String
    {
        var str = ""
        for _ in 0..<numberOfTimes {
            str += self
        }
        return str
    }
}