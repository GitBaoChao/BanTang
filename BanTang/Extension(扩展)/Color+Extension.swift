//
//  Color+Extension.swift


import UIKit

extension UIColor {

    class func colorWithCustom(r: CGFloat, g:CGFloat, b:CGFloat,alpha:CGFloat) -> UIColor {
        return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha:alpha)
    }
}