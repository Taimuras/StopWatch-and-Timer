//
//  Extension.swift
//  TabBar
//
//  Created by tami on 9/30/20.
//

import Foundation
import UIKit

extension UIColor {
    static let myDarkPurple = UIColor().colorFromHex("5d54a4")
    static let myLightBlue = UIColor().colorFromHex("848ccf")
    
    
    
    
    func colorFromHex(_ hex: String) -> UIColor {
        var hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if hexString.hasPrefix("#"){
            hexString.remove(at: hexString.startIndex)
        }
        
        if hexString.count != 6 {
            return UIColor.black
        }
        
        var rgb: UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&rgb)
        return UIColor.init(red: CGFloat((rgb & 0xFF0000) >> 32) / 255.0,
                            green: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
                            blue: CGFloat((rgb & 0xFF0000) >> 8) / 255.0,
                            alpha: 1.0)
    }
}
