//
//  LEANIcons.swift
//  GonativeIO
//
//  Created by Anuj Sevak on 2021-04-21.
//  Copyright © 2021 GoNative.io LLC. All rights reserved.
//

import Foundation
import SwiftIconFont

@objc class LEANIcons: NSObject {
    @objc public static let sharedIcons = LEANIcons()
    
    @objc public class func imageForIconIdentifier(_ name: String, size: CGFloat, systemBlueColor: Bool) -> UIImage? {
        return sharedIcons.imageFor(iconName: name, size: size, systemBlueColor: systemBlueColor)
    }
    
    @objc public class func fontAwesomeFontOfNameAndSize(_ iconName: String, size: CGFloat) -> UIFont {
        if iconName.hasPrefix("fab") {
            return UIFont.icon(from: .fontAwesome5Brand, ofSize: size)
        } else {
            return UIFont.icon(from: .fontAwesome5Solid, ofSize: size)
        }
    }
    
    @objc public class func fontAwesomeIconStringForIconIdentifier(_ identifier: String) -> String? {
        // separating icon code (fab fa-apple --> apple)
        let hyphenIconCode = String(identifier.suffix(from: identifier.firstIndex(of: "-")!))
        let iconCode = String(hyphenIconCode.suffix(hyphenIconCode.count - 1))
        return String.fontAwesome5Icon(iconCode)
    }
    
    private func imageFor(iconName: String, size: CGFloat, systemBlueColor: Bool) -> UIImage? {
        // separating icon code (fab fa-apple --> apple)
        let hyphenIconCode = String(iconName.suffix(from: iconName.firstIndex(of: "-")!))
        let iconCode = String(hyphenIconCode.suffix(hyphenIconCode.count - 1))
        if iconName.hasPrefix("fab") {
            if(systemBlueColor){
                return UIImage(from: .fontAwesome5Brand, code: iconCode, textColor: .systemBlue, size: CGSize(width: size, height: size))
            }
            return UIImage(from: .fontAwesome5Brand, code: iconCode, textColor: .black, size: CGSize(width: size, height: size))
        } else {
            if(systemBlueColor){
                return UIImage(from: .fontAwesome5Solid, code: iconCode, textColor: .systemBlue, size: CGSize(width: size, height: size))
            }
            return UIImage(from: .fontAwesome5Solid, code: iconCode, textColor: .black, size: CGSize(width: size, height: size))
        }
    }
}
