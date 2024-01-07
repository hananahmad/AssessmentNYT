//
//  UIView.swift
//  NYTAssessment
//
//  Created by Hanan on 07/01/2024.
//

import UIKit

extension UIView {
    // Round all corners with CALayerMask
    func roundAllCorners(radius: CGFloat = 0) {
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        self.layer.masksToBounds = true
        self.layer.cornerRadius = radius > 0 ? radius : self.bounds.height / 2
    }
}
