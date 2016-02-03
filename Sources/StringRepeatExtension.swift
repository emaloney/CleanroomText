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
    /**
     Returns a new `String` with the contents of the receiver concatenated
     to itself a given number of times.
     
     - parameter numberOfTimes: The number of times that the receiver should
     be repeated in the returned `String.
     
     - returns: The receiver, repeated `numberOfTimes`.
     */
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