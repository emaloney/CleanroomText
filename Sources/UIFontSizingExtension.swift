//
//  UIFontSizingExtension.swift
//  Cleanroom Project
//
//  Created by Evan Maloney on 7/29/15.
//  Copyright © 2015 Gilt Groupe. All rights reserved.
//

#if !os(macOS)

import Foundation
import UIKit

/**
 A `UIFont` extension that adds string sizing capabilities.
 */
extension UIFont
{
    //==========================================================================
    // MARK: Measuring text
    //--------------------------------------------------------------------------

    /**
     Calculates the size of the bounding rectangle required to draw a given
     text string in the font represented by the receiver.

     - parameter string: The text string to measure.

     - parameter maxWidth: The maximum width allowed for the text. If `string`
     would not fit within `maxWidth` on a single line, it will be wrapped
     according to the behavior of the specified line break mode.

     - parameter maxHeight: The maximum height allowed for the text.

     - parameter lineBreakMode: The line break mode to use for measuring.

     - parameter allowFractionalSize: If `true`, the returned size may contain
     fractional (non-integer sub-pixel) values. If `false`, the width and
     height components rounded up to the nearest integer (whole-pixel) value.

     - returns: The size required to draw the text string, constrained to the
     given `maxWidth` and `maxHeight`.
     */
    public func size(of string: String,
                     maxWidth: CGFloat = .greatestFiniteMagnitude,
                     maxHeight: CGFloat = .greatestFiniteMagnitude,
                     lineBreakMode: NSLineBreakMode = .byWordWrapping,
                     fractional allowFractionalSize: Bool = false)
        -> CGSize
    {
        return size(of: string,
                    maxSize: CGSize(width: maxWidth, height: maxHeight),
                    lineBreakMode: lineBreakMode,
                    fractional: allowFractionalSize)
    }

    /**
     Calculates the size of the bounding rectangle required to draw a given
     text string in the font represented by the receiver.

     - parameter string: The text string to measure.

     - parameter maxSize: The maximum size allowed for the text. If `string`
     would not fit within `maxSize.width` on a single line, it will be wrapped
     according to the behavior of the specified line break mode.

     - parameter lineBreakMode: The line break mode to use for measuring.

     - parameter allowFractionalSize: If `true`, the returned size may contain
     fractional (non-integer, sub-pixel) values. If `false`, the width and
     height components rounded up to the nearest integer (whole-pixel) value.

     - returns: The size required to draw the text string, constrained to the
     given `maxSize`.
     */
    public func size(of string: String,
                     maxSize: CGSize,
                     lineBreakMode: NSLineBreakMode = .byWordWrapping,
                     fractional allowFractionalSize: Bool = false)
        -> CGSize
    {
        let style = NSParagraphStyle.default.mutableCopy() as! NSMutableParagraphStyle
        style.lineBreakMode = .byWordWrapping

        return size(of: string,
                    maxSize: maxSize,
                    paragraphStyle: style,
                    fractional: allowFractionalSize)
    }

    //==========================================================================
    // MARK: Measuring text with a specific paragraph style
    //--------------------------------------------------------------------------

    /**
     Calculates the size of the bounding rectangle required to draw a given text
     string in the font represented by the receiver.

     - parameter string: The text string to measure.

     - parameter maxWidth: The maximum width allowed for the text. If `string`
     would not fit within `maxWidth` on a single line, it will be wrapped
     according to the specified paragraph style.

     - parameter maxHeight: The maximum height allowed for the text.

     - parameter paragraphStyle: The paragraph style for the text.

     - parameter allowFractionalSize: If `true`, the returned size may contain
     fractional (sub-pixel) values. If `false`, the width and height components
     rounded up to the nearest integer (whole-pixel) value.

     - returns: The size required to draw the text string, constrained to the
     given `maxWidth` and `maxHeight`.
    */
    public func size(of string: String,
                     maxWidth: CGFloat = .greatestFiniteMagnitude,
                     maxHeight: CGFloat = .greatestFiniteMagnitude,
                     paragraphStyle: NSParagraphStyle,
                     fractional allowFractionalSize: Bool = false)
        -> CGSize
    {
        return size(of: string,
                    maxSize: CGSize(width: maxWidth, height: maxHeight),
                    paragraphStyle: paragraphStyle,
                    fractional: allowFractionalSize)
    }

    /**
     Calculates the size of the bounding rectangle required to draw a given text
     string in the font represented by the receiver.

     - parameter string: The text string to measure.

     - parameter maxSize: The maximum size allowed for the text. If `string`
     would not fit within `maxSize.width` on a single line, it will be wrapped
     according to the specified paragraph style.

     - parameter paragraphStyle: The paragraph style for the text.

     - parameter allowFractionalSize: If `true`, the returned size may contain
     fractional (sub-pixel) values. If `false`, the width and height components
     rounded up to the nearest integer (whole-pixel) value.

     - returns: The size required to draw the text string, constrained to the
     given `maxSize`.
    */
    public func size(of string: String,
                     maxSize: CGSize,
                     paragraphStyle: NSParagraphStyle,
                     fractional allowFractionalSize: Bool = false)
        -> CGSize
    {
        let rect = string.boundingRect(with: maxSize,
                                       options: [.usesFontLeading,
                                                 .usesLineFragmentOrigin,
                                                 .truncatesLastVisibleLine],
                                       attributes: [NSFontAttributeName: self,
                                                    NSParagraphStyleAttributeName: paragraphStyle],
                                       context: nil)

        let size: CGSize
        if allowFractionalSize {
            size = rect.size
        } else {
            size = CGSize(width: ceil(rect.width), height: ceil(rect.height))
        }
        return size
    }
}

#endif
