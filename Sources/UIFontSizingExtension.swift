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
    // MARK: Measuring whole pixels with word wrapping
    //--------------------------------------------------------------------------

    /**
     Calculates the size of the bounding rectangle required to draw a given
     text string in the font represented by the receiver.

     - parameter string: The text string to measure.

     - parameter maxWidth: The maximum width allowed for the text. If `string`
     would not fit within `maxWidth` on a single line, it will be
     wrapped according to the behavior of `NSLineBreakMode.byWordWrapping`.

     - returns: The size required to draw the text string, with the width and
     height components rounded up to the nearest integer (whole-pixel) value.
     */
    public func sizeOf(string: String, maxWidth: CGFloat = .greatestFiniteMagnitude)
        -> CGSize
    {
        return sizeOf(string: string,
            maxSize: CGSize(width: maxWidth, height: .greatestFiniteMagnitude),
            lineBreakMode: .byWordWrapping,
            fractional: false)
    }

    /**
     Calculates the size of the bounding rectangle required to draw a given
     text string in the font represented by the receiver.

     - parameter string: The text string to measure.

     - parameter maxWidth: The maximum width allowed for the text. If `string`
     would not fit within `maxWidth` on a single line, it will be
     wrapped according to the behavior of `NSLineBreakMode.byWordWrapping`.

     - parameter maxHeight: The maximum height allowed for the text.

     - returns: The size required to draw the text string, with the width and
     height components rounded up to the nearest integer (whole-pixel) value.
     */
    public func sizeOf(string: String, maxWidth: CGFloat, maxHeight: CGFloat)
        -> CGSize
    {
        return sizeOf(string: string,
            maxSize: CGSize(width: maxWidth, height: maxHeight),
            lineBreakMode: .byWordWrapping,
            fractional: false)
    }

    /**
     Calculates the size of the bounding rectangle required to draw a given
     text string in the font represented by the receiver.

     - parameter string: The text string to measure.

     - parameter maxSize: The maximum size allowed for the text. If `string`
     would not fit within `maxSize.width` on a single line, it will be wrapped
     according to the behavior of `NSLineBreakMode.byWordWrapping`.

     - returns: The size required to draw the text string, with the width and
     height components rounded up to the nearest integer (whole-pixel) value.
    */
    public func sizeOf(string: String, maxSize: CGSize)
        -> CGSize
    {
        return sizeOf(string: string,
            maxSize: maxSize,
            lineBreakMode: .byWordWrapping,
            fractional: false)
    }

    //==========================================================================
    // MARK: Measuring fractional pixels with word wrapping
    //--------------------------------------------------------------------------

    /**
     Calculates the size of the bounding rectangle required to draw a given
     text string in the font represented by the receiver.

     - parameter string: The text string to measure.

     - parameter maxWidth: The maximum width allowed for the text. If `string`
     would not fit within `maxWidth` on a single line, it will be
     wrapped according to the behavior of `NSLineBreakMode.byWordWrapping`.

     - parameter allowFractionalSize: If `true`, the returned size may contain
     fractional (sub-pixel) values. If `false`, the width and height components
     rounded up to the nearest integer (whole-pixel) value.

     - returns: The size required to draw the text string.
    */
    public func sizeOf(string: String, maxWidth: CGFloat = .greatestFiniteMagnitude, fractional allowFractionalSize: Bool)
        -> CGSize
    {
        return sizeOf(string: string,
            maxSize: CGSize(width: maxWidth, height: .greatestFiniteMagnitude),
            lineBreakMode: .byWordWrapping,
            fractional: allowFractionalSize)
    }

    /**
     Calculates the size of the bounding rectangle required to draw a given
     text string in the font represented by the receiver.

     - parameter string: The text string to measure.

     - parameter maxWidth: The maximum width allowed for the text. If `string`
     would not fit within `maxWidth` on a single line, it will be
     wrapped according to the behavior of `NSLineBreakMode.byWordWrapping`.

     - parameter maxHeight: The maximum height allowed for the text.

     - parameter allowFractionalSize: If `true`, the returned size may contain
     fractional (sub-pixel) values. If `false`, the width and height components
     rounded up to the nearest integer (whole-pixel) value.

     - returns: The size required to draw the text string.
    */
    public func sizeOf(string: String, maxWidth: CGFloat, maxHeight: CGFloat, fractional allowFractionalSize: Bool)
        -> CGSize
    {
        return sizeOf(string: string,
            maxSize: CGSize(width: maxWidth, height: maxHeight),
            lineBreakMode: .byWordWrapping,
            fractional: allowFractionalSize)
    }

    /**
     Calculates the size of the bounding rectangle required to draw a given
     text string in the font represented by the receiver.

     - parameter string: The text string to measure.

     - parameter maxSize: The maximum size allowed for the text. If `string` 
     would not fit within `maxSize.width` on a single line, it will be wrapped
     according to the behavior of `NSLineBreakMode.byWordWrapping`.

     - parameter allowFractionalSize: If `true`, the returned size may contain
     fractional (sub-pixel) values. If `false`, the width and height components
     rounded up to the nearest integer (whole-pixel) value.

     - returns: The size required to draw the text string.
    */
    public func sizeOf(string: String, maxSize: CGSize, fractional allowFractionalSize: Bool)
        -> CGSize
    {
        return sizeOf(string: string,
            maxSize: maxSize,
            lineBreakMode: .byWordWrapping,
            fractional: allowFractionalSize)
    }

    //==========================================================================
    // MARK: Measuring whole pixels with a specific line break mode
    //--------------------------------------------------------------------------

    /**
     Calculates the size of the bounding rectangle required to draw a given
     text string in the font represented by the receiver.

     - parameter string: The text string to measure.

     - parameter maxWidth: The maximum width allowed for the text. If `string`
     would not fit within `maxWidth` on a single line, it will be wrapped 
     according to the behavior of the specified line break mode.

     - parameter lineBreakMode: The line break mode to use for measuring.

     - returns: The size required to draw the text string.
    */
    public func sizeOf(string: String, maxWidth: CGFloat = .greatestFiniteMagnitude, lineBreakMode: NSLineBreakMode)
        -> CGSize
    {
        return sizeOf(string: string,
            maxSize: CGSize(width: maxWidth, height: .greatestFiniteMagnitude),
            lineBreakMode: lineBreakMode,
            fractional: false)
    }

    /**
     Calculates the size of the bounding rectangle required to draw a given
     text string in the font represented by the receiver.

     - parameter string: The text string to measure.

     - parameter maxWidth: The maximum width allowed for the text. If `string`
     would not fit within `maxWidth` on a single line, it will be wrapped
     according to the behavior of the specified line break mode.

     - parameter maxHeight: The maximum height allowed for the text.
    
     - parameter lineBreakMode: The line break mode to use for measuring.

     - returns: The size required to draw the text string.
    */
    public func sizeOf(string: String, maxWidth: CGFloat, maxHeight: CGFloat, lineBreakMode: NSLineBreakMode)
        -> CGSize
    {
        return sizeOf(string: string,
            maxSize: CGSize(width: maxWidth, height: maxHeight),
            lineBreakMode: lineBreakMode,
            fractional: false)
    }

    /**
     Calculates the size of the bounding rectangle required to draw a given
     text string in the font represented by the receiver.

     - parameter string: The text string to measure.

     - parameter maxSize: The maximum size allowed for the text. If `string` 
     would not fit within `maxSize.width` on a single line, it will be wrapped
     according to the behavior of the specified line break mode.

     - parameter lineBreakMode: The line break mode to use for measuring.

     - returns: The size required to draw the text string.
    */
    public func sizeOf(string: String, maxSize: CGSize, lineBreakMode: NSLineBreakMode)
        -> CGSize
    {
        return sizeOf(string: string,
            maxSize: maxSize,
            lineBreakMode: lineBreakMode,
            fractional: false)
    }

    //==========================================================================
    // MARK: Measuring fractional pixels with a specific line break mode
    //--------------------------------------------------------------------------

    /**
     Calculates the size of the bounding rectangle required to draw a given
     text string in the font represented by the receiver.

     - parameter string: The text string to measure.

     - parameter maxWidth: The maximum width allowed for the text. If `string`
     would not fit within `maxWidth` on a single line, it will be wrapped
     according to the behavior of the specified line break mode.

     - parameter lineBreakMode: The line break mode to use for measuring.

     - parameter allowFractionalSize: If `true`, the returned size may contain
     fractional (sub-pixel) values. If `false`, the width and height components
     rounded up to the nearest integer (whole-pixel) value.

     - returns: The size required to draw the text string.
    */
    public func sizeOf(string: String, maxWidth: CGFloat = .greatestFiniteMagnitude, lineBreakMode: NSLineBreakMode, fractional allowFractionalSize: Bool)
        -> CGSize
    {
        return sizeOf(string: string,
            maxSize: CGSize(width: maxWidth, height: .greatestFiniteMagnitude),
            lineBreakMode: lineBreakMode,
            fractional: allowFractionalSize)
    }

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
     fractional (sub-pixel) values. If `false`, the width and height components
     rounded up to the nearest integer (whole-pixel) value.

     - returns: The size required to draw the text string.
    */
    public func sizeOf(string: String, maxWidth: CGFloat, maxHeight: CGFloat, lineBreakMode: NSLineBreakMode, fractional allowFractionalSize: Bool)
        -> CGSize
    {
        return sizeOf(string: string,
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
     fractional (sub-pixel) values. If `false`, the width and height components
     rounded up to the nearest integer (whole-pixel) value.

     - returns: The size required to draw the text string.
    */
    public func sizeOf(string: String, maxSize: CGSize, lineBreakMode: NSLineBreakMode, fractional allowFractionalSize: Bool)
        -> CGSize
    {
        let style = NSParagraphStyle.default.mutableCopy() as! NSMutableParagraphStyle
        style.lineBreakMode = .byWordWrapping

        return sizeOf(string: string,
            maxSize: maxSize,
            paragraphStyle: style,
            fractional: allowFractionalSize)
    }

    //==========================================================================
    // MARK: Measuring whole pixels with a specific paragraph style
    //--------------------------------------------------------------------------

    /**
     Calculates the size of the bounding rectangle required to draw a given
     text string in the font represented by the receiver.

     - parameter string: The text string to measure.

     - parameter maxWidth: The maximum width allowed for the text. If `string`
     would not fit within `maxWidth` on a single line, it will be wrapped
     according to the specified paragraph style.

     - parameter paragraphStyle: The paragraph style for the text.

     - returns: The size required to draw the text string, with the width and
     height components rounded up to the nearest integer (whole-pixel) value.
    */
    public func sizeOf(string: String, maxWidth: CGFloat = .greatestFiniteMagnitude, paragraphStyle: NSParagraphStyle)
        -> CGSize
    {
        return sizeOf(string: string,
            maxSize: CGSize(width: maxWidth, height: .greatestFiniteMagnitude),
            paragraphStyle: paragraphStyle,
            fractional: false)
    }

    /**
     Calculates the size of the bounding rectangle required to draw a given
     text string in the font represented by the receiver.

     - parameter string: The text string to measure.

     - parameter maxWidth: The maximum width allowed for the text. If `string`
     would not fit within `maxWidth` on a single line, it will be wrapped
     according to the specified paragraph style.

     - parameter maxHeight: The maximum height allowed for the text.
    
     - parameter paragraphStyle: The paragraph style for the text.

     - returns: The size required to draw the text string, with the width and
     height components rounded up to the nearest integer (whole-pixel) value.
    */
    public func sizeOf(string: String, maxWidth: CGFloat, maxHeight: CGFloat, paragraphStyle: NSParagraphStyle)
        -> CGSize
    {
        return sizeOf(string: string,
            maxSize: CGSize(width: maxWidth, height: maxHeight),
            paragraphStyle: paragraphStyle,
            fractional: false)
    }

    /**
     Calculates the size of the bounding rectangle required to draw a given
     text string in the font represented by the receiver.

     - parameter string: The text string to measure.

     - parameter maxSize: The maximum size allowed for the text. If `string`
     would not fit within `maxSize.width` on a single line, it will be wrapped
     according to the specified paragraph style.

     - parameter paragraphStyle: The paragraph style for the text.

     - returns: The size required to draw the text string, with the width and
     height components rounded up to the nearest integer (whole-pixel) value.
    */
    public func sizeOf(string: String, maxSize: CGSize, paragraphStyle: NSParagraphStyle)
        -> CGSize
    {
        return sizeOf(string: string,
            maxSize: maxSize,
            paragraphStyle: paragraphStyle,
            fractional: false)
    }

    //==========================================================================
    // MARK: Measuring fractional pixels with a specific paragraph style
    //--------------------------------------------------------------------------

    /**
     Calculates the size of the bounding rectangle required to draw a given text
     string in the font represented by the receiver.

     - parameter string: The text string to measure.

     - parameter maxWidth: The maximum width allowed for the text. If `string`
     would not fit within `maxWidth` on a single line, it will be wrapped
     according to the specified paragraph style.

     - parameter paragraphStyle: The paragraph style for the text.

     - parameter allowFractionalSize: If `true`, the returned size may contain
     fractional (sub-pixel) values. If `false`, the width and height components
     rounded up to the nearest integer (whole-pixel) value.

     - returns: The size required to draw the text string.
    */
    public func sizeOf(string: String, maxWidth: CGFloat = .greatestFiniteMagnitude, paragraphStyle: NSParagraphStyle, fractional allowFractionalSize: Bool)
        -> CGSize
    {
        return sizeOf(string: string,
            maxSize: CGSize(width: maxWidth, height: .greatestFiniteMagnitude),
            paragraphStyle: paragraphStyle,
            fractional: allowFractionalSize)
    }

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

     - returns: The size required to draw the text string.
    */
    public func sizeOf(string: String, maxWidth: CGFloat, maxHeight: CGFloat, paragraphStyle: NSParagraphStyle, fractional allowFractionalSize: Bool)
        -> CGSize
    {
        return sizeOf(string: string,
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

     - returns: The size required to draw the text string.
    */
    public func sizeOf(string: String, maxSize: CGSize, paragraphStyle: NSParagraphStyle, fractional allowFractionalSize: Bool)
        -> CGSize
    {
        let rect = string.boundingRect(with: maxSize,
            options: [.usesFontLeading, .usesLineFragmentOrigin, .truncatesLastVisibleLine],
            attributes: [NSFontAttributeName: self, NSParagraphStyleAttributeName: paragraphStyle],
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
