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
        return trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
}

/**
A `NSAttributedString` extension that adds a `trim()` function for removing 
leading and trailing whitespace.
*/
public extension AttributedString
{
    /**
    Returns a version of the receiver with whitespace and newline characters
    removed from the beginning and end of the string.

    :returns:       A trimmed version of the receiver.
    */
    public func trim()
        -> AttributedString
    {
        let doNotTrim = CharacterSet.whitespacesAndNewlines.inverted

        let operateOn = string as NSString
        let startRange = operateOn.rangeOfCharacter(from: doNotTrim)
        let endRange = operateOn.rangeOfCharacter(from: doNotTrim, options: .backwardsSearch)

        let start = (startRange.length > 0) ? startRange.location : 0
        let end = (endRange.length > 0) ? NSMaxRange(endRange) : operateOn.length

        return attributedSubstring(from: NSMakeRange(start, end - start))
    }
}
