//
//  extension.swift
//  NotesiOSApp
//
//  Created by Rodrigo Colozio on 02/06/23.
//

import UIKit

extension UIView {
    enum ViewSide {
        case left, right, bottom, top
    }
    
    func addBorder(toSide side: ViewSide, withColor color: CGColor, andThickness thickness: CGFloat){
        let border = CALayer()
        border.backgroundColor = color
        
        switch side {
        case .left:
            border.frame = CGRect(x: frame.minX, y: frame.minY, width: thickness, height: frame.height)
        case .right:
            border.frame = CGRect(x: frame.maxX, y: frame.minY, width: thickness, height: frame.height)
        case .bottom:
            border.frame = CGRect(x: frame.minX, y: frame.maxY, width: frame.width, height: thickness)
        case .top:
            border.frame = CGRect(x: frame.minX, y: frame.minY, width: frame.width, height: thickness)

        }
        layer.addSublayer(border)
    }
}

extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int){
        self.init(red: CGFloat((red)/255), green: CGFloat((green)/255), blue: CGFloat((blue)/255), alpha: 1)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
    
}
