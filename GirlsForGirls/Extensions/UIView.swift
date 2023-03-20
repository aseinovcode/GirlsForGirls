//
//  UIView.swift
//  GirlsForGirls
//
//  Created by Zalkar Aseinov on 16.03.2023.
//

import Foundation
import UIKit

extension UIView {
    func layerGradient() {
//        let layer0 = CAGradientLayer()
//        layer0.colors = [
//          UIColor(red: 0.149, green: 0.2, blue: 0.259, alpha: 0.05).cgColor,
//          UIColor(red: 0.083, green: 0.077, blue: 0.077, alpha: 1).cgColor
//        ]
//        layer0.locations = [0, 0.95]
//        layer0.startPoint = CGPoint(x: 0.25, y: 0.5)
//        layer0.endPoint = CGPoint(x: 0.75, y: 0.5)
//        layer0.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 0, b: 1, c: -1, d: 0, tx: 1, ty: 0))
//        layer0.bounds = self.bounds.insetBy(dx: -0.5 * self.bounds.size.width, dy: -0.5 * self.bounds.size.height)
//        layer0.position = self.center
//        self.layer.addSublayer(layer0)
        
        let gradientLayer = CAGradientLayer()
        //gradientLayer.frame = self.bounds
        gradientLayer.colors = [
            UIColor(red: 0.149, green: 0.2, blue: 0.259, alpha: 0.05).cgColor,
            UIColor(red: 0.083, green: 0.077, blue: 0.077, alpha: 1).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0.25, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 0.75, y: 0.5)
        gradientLayer.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 0, b: 1, c: -1, d: 0, tx: 1, ty: 0))
        gradientLayer.bounds = self.bounds.insetBy(dx: -0.5 * self.bounds.size.width, dy: -0.5 * self.bounds.size.height)
        gradientLayer.position = self.center
        self.layer.addSublayer(gradientLayer)
    }
}
