//
//  UIColor.swift
//
import UIKit

extension UIColor {
    public class func colorFromHexString(_ hexString: String) -> UIColor {
        let colorString = hexString.replacingOccurrences(of: "#", with: "").uppercased() as NSString
        let alpha, red, blue, green: Float
        alpha = 1.0
        red = self.colorComponentsFrom(colorString, start: 0, length: 2)
        green = self.colorComponentsFrom(colorString, start: 2, length: 2)
        blue = self.colorComponentsFrom(colorString, start: 4, length: 2)
        return UIColor(colorLiteralRed: red, green: green, blue: blue, alpha: alpha)
    }
    
    fileprivate class func colorComponentsFrom(_ string: NSString, start: Int, length: Int) -> Float {
        NSMakeRange(start, length)
        let subString = string.substring(with: NSMakeRange(start, length))
        var hexValue: UInt32 = 0
        Scanner(string: subString).scanHexInt32(&hexValue)
        return Float(hexValue) / 255.0
    }
}
