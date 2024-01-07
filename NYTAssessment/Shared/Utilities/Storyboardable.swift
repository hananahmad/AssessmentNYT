//
//  Storyboardable.swift
//  NYTAssessment
//
//  Created by Hanan on 07/01/2024.
//

import UIKit

protocol Storyboardable {
    static var storyboardIdentifier: String { get }

    // MARK: Methods

    static func instantiate(withStoryboard: Storyboard) -> Self
}

extension Storyboardable where Self: UIViewController {
    // MARK: Properties
    
    static var storyboardIdentifier: String {
        return String(describing: self)
    }

    // MARK: Methods

    static func instantiate(withStoryboard storyboard: Storyboard) -> Self {
        guard let viewController = UIStoryboard(name: storyboard.rawValue, bundle: .main).instantiateViewController(withIdentifier: storyboardIdentifier) as? Self else {
            fatalError("Unable to Instantiate View Controller With Storyboard Identifier \(storyboardIdentifier)")
        }

        return viewController
    }
}
