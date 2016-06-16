//
//  UIFontSizingExtension.swift
//  Cleanroom Project
//
//  Created by Evan Maloney on 7/29/15.
//  Copyright © 2015 Gilt Groupe. All rights reserved.
//

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

    :param:     str The text string to measure.

    :param:     maxWidth The maximum width allowed for the text. If `str` would 
                not fit within `maxWidth` on a single line, it will be wrapped
                according to the line break mode `.ByWordWrapping`.

    :returns:   The size required to draw the text string, with the width and
                height components rounded up to the nearest integer
                (whole-pixel) value.
     */
    public func sizeString(_ str: String, maxWidth: CGFloat)
        -> CGSize
    {
        return sizeString(str,
            maxSize: CGSize(width: maxWidth, height: CGFloat(Int64.max)),
            lineBreakMode: NSLineBreakMode.byWordWrapping,
            fractional: false)
    }

    /**
    Calculates the size of the bounding rectangle required to draw a given
    text string in the font represented by the receiver.
     
    :param:     str The text string to measure.

    :param:     maxWidth The maximum width allowed for the text. If `str` would 
                not fit within `maxWidth` on a single line, it will be wrapped
                according to the line break mode `.ByWordWrapping`.

    :param:     maxHeight The maximum height allowed for the text.

    :returns:   The size required to draw the text string, with the width and
                height components rounded up to the nearest integer
                (whole-pixel) value.
     */
    public func sizeString(_ str: String, maxWidth: CGFloat, maxHeight: CGFloat)
        -> CGSize
    {
        return sizeString(str,
            maxSize: CGSize(width: maxWidth, height: maxHeight),
            lineBreakMode: NSLineBreakMode.byWordWrapping,
            fractional: false)
    }

    /**
    Calculates the size of the bounding rectangle required to draw a given
    text string in the font represented by the receiver.

    :param:     str The text string to measure.

    :param:     maxSize The maximum size allowed for the text. If `str` would
                not fit within `maxSize.width` on a single line, it will be
                wrapped according to the line break mode `.ByWordWrapping`.

    :returns:   The size required to draw the text string, with the width and
                height components rounded up to the nearest integer
                (whole-pixel) value.
    */
    public func sizeString(_ str: String, maxSize: CGSize)
        -> CGSize
    {
        return sizeString(str,
            maxSize: maxSize,
            lineBreakMode: NSLineBreakMode.byWordWrapping,
            fractional: false)
    }

    //==========================================================================
    // MARK: Measuring fractional pixels with word wrapping
    //--------------------------------------------------------------------------

    /**
    Calculates the size of the bounding rectangle required to draw a given
    text string in the font represented by the receiver.
     
    :param:     str The text string to measure.

    :param:     maxWidth The maximum width allowed for the text. If `str` would 
                not fit within `maxWidth` on a single line, it will be wrapped
                according to the line break mode `.ByWordWrapping`.

    :param:     allowFractionalSize If `true`, the returned size may contain
                fractional (sub-pixel) values. If `false`, the width and
                height components rounded up to the nearest integer
                (whole-pixel) value.

    :returns:   The size required to draw the text string.
    */
    public func sizeString(_ str: String, maxWidth: CGFloat, fractional allowFractionalSize: Bool)
        -> CGSize
    {
        return sizeString(str,
            maxSize: CGSize(width: maxWidth, height: CGFloat(Int64.max)),
            lineBreakMode: NSLineBreakMode.byWordWrapping,
            fractional: allowFractionalSize)
    }

    /**
    Calculates the size of the bounding rectangle required to draw a given
    text string in the font represented by the receiver.
     
    :param:     str The text string to measure.

    :param:     maxWidth The maximum width allowed for the text. If `str` would 
                not fit within `maxWidth` on a single line, it will be wrapped
                according to the line break mode `.ByWordWrapping`.

    :param:     maxHeight The maximum height allowed for the text.

    :param:     allowFractionalSize If `true`, the returned size may contain
                fractional (sub-pixel) values. If `false`, the width and
                height components rounded up to the nearest integer
                (whole-pixel) value.

    :returns:   The size required to draw the text string.
    */
    public func sizeString(_ str: String, maxWidth: CGFloat, maxHeight: CGFloat, fractional allowFractionalSize: Bool)
        -> CGSize
    {
        return sizeString(str,
            maxSize: CGSize(width: maxWidth, height: maxHeight),
            lineBreakMode: NSLineBreakMode.byWordWrapping,
            fractional: allowFractionalSize)
    }

    /**
    Calculates the size of the bounding rectangle required to draw a given
    text string in the font represented by the receiver.
     
    :param:     str The text string to measure.

    :param:     maxSize The maximum size allowed for the text. If `str` would
                not fit within `maxSize.width` on a single line, it will be
                wrapped according to the line break mode `.ByWordWrapping`.

    :param:     allowFractionalSize If `true`, the returned size may contain
                fractional (sub-pixel) values. If `false`, the width and
                height components rounded up to the nearest integer
                (whole-pixel) value.

    :returns:   The size required to draw the text string.
    */
    public func sizeString(_ str: String, maxSize: CGSize, fractional allowFractionalSize: Bool)
        -> CGSize
    {
        return sizeString(str,
            maxSize: maxSize,
            lineBreakMode: NSLineBreakMode.byWordWrapping,
            fractional: allowFractionalSize)
    }

    //==========================================================================
    // MARK: Measuring whole pixels with a specific line break mode
    //--------------------------------------------------------------------------

    /**
    Calculates the size of the bounding rectangle required to draw a given
    text string in the font represented by the receiver.
     
    :param:     str The text string to measure.

    :param:     maxWidth The maximum width allowed for the text. If `str` would 
                not fit within `maxWidth` on a single line, it will be wrapped
                according to the specified line break mode.

    :param:     lineBreakMode The line break mode to use for measuring the text.

    :returns:   The size required to draw the text string.
    */
    public func sizeString(_ str: String, maxWidth: CGFloat, lineBreakMode: NSLineBreakMode)
        -> CGSize
    {
        return sizeString(str,
            maxSize: CGSize(width: maxWidth, height: CGFloat(Int64.max)),
            lineBreakMode: lineBreakMode,
            fractional: false)
    }

    /**
    Calculates the size of the bounding rectangle required to draw a given
    text string in the font represented by the receiver.
     
    :param:     str The text string to measure.

    :param:     maxWidth The maximum width allowed for the text. If `str` would 
                not fit within `maxWidth` on a single line, it will be wrapped
                according to the specified line break mode.

    :param:     maxHeight The maximum height allowed for the text.
    
    :param:     lineBreakMode The line break mode to use for measuring the text.

    :returns:   The size required to draw the text string.
    */
    public func sizeString(_ str: String, maxWidth: CGFloat, maxHeight: CGFloat, lineBreakMode: NSLineBreakMode)
        -> CGSize
    {
        return sizeString(str,
            maxSize: CGSize(width: maxWidth, height: maxHeight),
            lineBreakMode: lineBreakMode,
            fractional: false)
    }

    /**
    Calculates the size of the bounding rectangle required to draw a given
    text string in the font represented by the receiver.
     
    :param:     str The text string to measure.

    :param:     maxSize The maximum size allowed for the text. If `str` would
                not fit within `maxSize.width` on a single line, it will be
                wrapped according to the specified line break mode.

    :param:     lineBreakMode The line break mode to use for measuring the text.

    :returns:   The size required to draw the text string.
    */
    public func sizeString(_ str: String, maxSize: CGSize, lineBreakMode: NSLineBreakMode)
        -> CGSize
    {
        return sizeString(str,
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
     
    :param:     str The text string to measure.

    :param:     maxWidth The maximum width allowed for the text. If `str` would 
                not fit within `maxWidth` on a single line, it will be wrapped
                according to the specified line break mode.

    :param:     lineBreakMode The line break mode to use for measuring the text.

    :param:     allowFractionalSize If `true`, the returned size may contain
                fractional (sub-pixel) values. If `false`, the width and
                height components rounded up to the nearest integer
                (whole-pixel) value.

    :returns:   The size required to draw the text string.
    */
    public func sizeString(_ str: String, maxWidth: CGFloat, lineBreakMode: NSLineBreakMode, fractional allowFractionalSize: Bool)
        -> CGSize
    {
        return sizeString(str,
            maxSize: CGSize(width: maxWidth, height: CGFloat(Int64.max)),
            lineBreakMode: lineBreakMode,
            fractional: allowFractionalSize)
    }

    /**
    Calculates the size of the bounding rectangle required to draw a given
    text string in the font represented by the receiver.
     
    :param:     str The text string to measure.

    :param:     maxWidth The maximum width allowed for the text. If `str` would 
                not fit within `maxWidth` on a single line, it will be wrapped
                according to the specified line break mode.

    :param:     maxHeight The maximum height allowed for the text.

    :param:     lineBreakMode The line break mode to use for measuring the text.

    :param:     allowFractionalSize If `true`, the returned size may contain
                fractional (sub-pixel) values. If `false`, the width and
                height components rounded up to the nearest integer
                (whole-pixel) value.

    :returns:   The size required to draw the text string.
    */
    public func sizeString(_ str: String, maxWidth: CGFloat, maxHeight: CGFloat, lineBreakMode: NSLineBreakMode, fractional allowFractionalSize: Bool)
        -> CGSize
    {
        return sizeString(str,
            maxSize: CGSize(width: maxWidth, height: maxHeight),
            lineBreakMode: lineBreakMode,
            fractional: allowFractionalSize)
    }

    /**
    Calculates the size of the bounding rectangle required to draw a given
    text string in the font represented by the receiver.
     
    :param:     str The text string to measure.

    :param:     maxSize The maximum size allowed for the text. If `str` would
                not fit within `maxSize.width` on a single line, it will be
                wrapped according to the specified line break mode.

    :param:     lineBreakMode The line break mode to use for measuring the text.

    :param:     allowFractionalSize If `true`, the returned size may contain
                fractional (sub-pixel) values. If `false`, the width and
                height components rounded up to the nearest integer
                (whole-pixel) value.

    :returns:   The size required to draw the text string.
    */
    public func sizeString(_ str: String, maxSize: CGSize, lineBreakMode: NSLineBreakMode, fractional allowFractionalSize: Bool)
        -> CGSize
    {
        let style = NSParagraphStyle.default().mutableCopy() as! NSMutableParagraphStyle
        style.lineBreakMode = .byWordWrapping

        return sizeString(str,
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

    :param:     str The text string to measure.

    :param:     maxWidth The maximum width allowed for the text. If `str` would 
                not fit within `maxWidth` on a single line, it will be wrapped
                according to the specified paragraph style.

    :param:     paragraphStyle The paragraph style for the text.

    :returns:   The size required to draw the text string, with the width and
                height components rounded up to the nearest integer
                (whole-pixel) value.
    */
    public func sizeString(_ str: String, maxWidth: CGFloat, paragraphStyle: NSParagraphStyle)
        -> CGSize
    {
        return sizeString(str,
            maxSize: CGSize(width: maxWidth, height: CGFloat(Int64.max)),
            paragraphStyle: paragraphStyle,
            fractional: false)
    }

    /**
    Calculates the size of the bounding rectangle required to draw a given
    text string in the font represented by the receiver.

    :param:     str The text string to measure.

    :param:     maxWidth The maximum width allowed for the text. If `str` would 
                not fit within `maxWidth` on a single line, it will be wrapped
                according to the specified paragraph style.

    :param:     maxHeight The maximum height allowed for the text.
    
    :param:     paragraphStyle The paragraph style for the text.

    :returns:   The size required to draw the text string, with the width and
                height components rounded up to the nearest integer
                (whole-pixel) value.
    */
    public func sizeString(_ str: String, maxWidth: CGFloat, maxHeight: CGFloat, paragraphStyle: NSParagraphStyle)
        -> CGSize
    {
        return sizeString(str,
            maxSize: CGSize(width: maxWidth, height: maxHeight),
            paragraphStyle: paragraphStyle,
            fractional: false)
    }

    /**
    Calculates the size of the bounding rectangle required to draw a given
    text string in the font represented by the receiver.

    :param:     str The text string to measure.

    :param:     maxSize The maximum size allowed for the text. If `str` would
                not fit within `maxSize.width` on a single line, it will be
                wrapped according to the specified paragraph style.

    :param:     paragraphStyle The paragraph style for the text.

    :returns:   The size required to draw the text string, with the width and
                height components rounded up to the nearest integer
                (whole-pixel) value.
    */
    public func sizeString(_ str: String, maxSize: CGSize, paragraphStyle: NSParagraphStyle)
        -> CGSize
    {
        return sizeString(str,
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

    :param:     str The text string to measure.

    :param:     maxWidth The maximum width allowed for the text. If `str` would
                not fit within `maxWidth` on a single line, it may be wrapped 
                according to the specified paragraph style.

    :param:     paragraphStyle The paragraph style for the text.

    :param:     allowFractionalSize If `true`, the returned size may contain
                fractional (sub-pixel) values. If `false`, the width and
                height components rounded up to the nearest integer
                (whole-pixel) value.

    :returns:   The size required to draw the text string.
    */
    public func sizeString(_ str: String, maxWidth: CGFloat, paragraphStyle: NSParagraphStyle, fractional allowFractionalSize: Bool)
        -> CGSize
    {
        return sizeString(str,
            maxSize: CGSize(width: maxWidth, height: CGFloat(Int64.max)),
            paragraphStyle: paragraphStyle,
            fractional: allowFractionalSize)
    }

    /**
    Calculates the size of the bounding rectangle required to draw a given text
    string in the font represented by the receiver.

    :param:     str The text string to measure.

    :param:     maxWidth The maximum width allowed for the text. If `str` would 
                not fit within `maxWidth` on a single line, it will be wrapped
                according to the specified paragraph style.

    :param:     maxHeight The maximum height allowed for the text.

    :param:     paragraphStyle The paragraph style for the text.

    :param:     allowFractionalSize If `true`, the returned size may contain
                fractional (sub-pixel) values. If `false`, the width and
                height components rounded up to the nearest integer
                (whole-pixel) value.

    :returns:   The size required to draw the text string.
    */
    public func sizeString(_ str: String, maxWidth: CGFloat, maxHeight: CGFloat, paragraphStyle: NSParagraphStyle, fractional allowFractionalSize: Bool)
        -> CGSize
    {
        return sizeString(str,
            maxSize: CGSize(width: maxWidth, height: maxHeight),
            paragraphStyle: paragraphStyle,
            fractional: allowFractionalSize)
    }

    /**
    Calculates the size of the bounding rectangle required to draw a given text
    string in the font represented by the receiver.

    :param:     str The text string to measure.

    :param:     maxSize The maximum size allowed for the text. If `str` would
                not fit within `maxSize.width` on a single line, it will be
                wrapped according to the specified paragraph style.

    :param:     paragraphStyle The paragraph style for the text.

    :param:     allowFractionalSize If `true`, the returned size may contain
                fractional (sub-pixel) values. If `false`, the width and
                height components rounded up to the nearest integer
                (whole-pixel) value.

    :returns:   The size required to draw the text string.
    */
    public func sizeString(_ str: String, maxSize: CGSize, paragraphStyle: NSParagraphStyle, fractional allowFractionalSize: Bool)
        -> CGSize
    {
        let rect = str.boundingRect(with: maxSize,
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
