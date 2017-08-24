//
//  UIFontMonospacedNumbersExtension.swift
//  CleanroomText
//
//  Created by Evan Maloney on 8/23/17.
//  Copyright © 2017 Gilt Groupe. All rights reserved.
//

#if !os(macOS)

import UIKit

extension UIFont
{
    /**
     Returns a version of the receiving `UIFont` that will use monospaced
     digits.
     */
    public var withMonospacedDigits: UIFont {
        let attributes: [UIFontDescriptor.AttributeName: [UIFontDescriptor.FeatureKey: Any]] = [.featureSettings: [.featureIdentifier: kNumberSpacingType, .typeIdentifier: kMonospacedNumbersSelector]]
        return UIFont(descriptor: fontDescriptor.addingAttributes(attributes), size: 0)
    }
}

#endif
