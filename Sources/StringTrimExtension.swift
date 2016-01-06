//
//  StringTrimExtension.swift
//  Cleanroom Project
//
//  Created by Evan Maloney on 2/19/15.
//  Copyright © 2015 Gilt Groupe. All rights reserved.
//

import Foundation

/**
A `String` extension that adds a `trim()` function for removing leading and
trailing whitespace.
*/
public extension String
{
    /**
    Returns a version of the receiver with whitespace and newline characters
    removed from the beginning and end of the string.
    
    :returns:       A trimmed version of the receiver.
    */
    public func trim()
        -> String
    {
        return stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
    }
}

/**
A `NSAttributedString` extension that adds a `trim()` function for removing 
leading and trailing whitespace.
*/
public extension NSAttributedString
{
    /**
    Returns a version of the receiver with whitespace and newline characters
    removed from the beginning and end of the string.

    :returns:       A trimmed version of the receiver.
    */
    public func trim()
        -> NSAttributedString
    {
        let doNotTrim = NSCharacterSet.whitespaceAndNewlineCharacterSet().invertedSet

        let operateOn = string as NSString
        let startRange = operateOn.rangeOfCharacterFromSet(doNotTrim)
        let endRange = operateOn.rangeOfCharacterFromSet(doNotTrim, options: .BackwardsSearch)

        let start = (startRange.length > 0) ? startRange.location : 0
        let end = (endRange.length > 0) ? NSMaxRange(endRange) : operateOn.length

        return attributedSubstringFromRange(NSMakeRange(start, end - start))
    }
}
