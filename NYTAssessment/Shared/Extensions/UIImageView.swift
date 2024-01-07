//
//  UIImageView.swift
//  NYTAssessment
//
//  Created by Hanan on 07/01/2024.
//

import UIKit
import SDWebImage

extension UIImageView {
    func setImage(for path: String?) {
        if let path, let url = URL(string: path) {
            sd_setImage(with: url)
        }
    }
}
