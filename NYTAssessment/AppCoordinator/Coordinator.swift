//
//  Coordinator.swift
//  NYTAssessment
//
//  Created by Hanan on 07/01/2024.
//

import UIKit

enum ChildCoordinatorFactory {
    case articleDetail(mostPopularArticle: MostPopularArticle)
}

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController? { get set }
    
    func navigate(to childCoordinator: ChildCoordinatorFactory)
    
    func popCoordinator()
    func start()
}

extension Coordinator {
    func navigate(to childCoordinator: ChildCoordinatorFactory) {}
    func popCoordinator() {}
}

protocol ParentCoordinator: Coordinator {
    var children: [Coordinator] { get set }
}

extension ParentCoordinator {
    /// Removing a coordinator inside a children. This call is important to prevent memory leak.
    /// - Parameter coordinator: Coordinator that finished.
    func childDidFinish(_ coordinator: Coordinator?) {
        // Call this if a coordinator is done.
        for (index, child) in children.enumerated() {
            if child === coordinator {
                children.remove(at: index)
                break
            }
        }
    }
}

protocol ChildCoordinator: Coordinator {
    var parentCoordinator: ParentCoordinator? { get set }
    
    func passParameter(value: Any?)
}

extension ChildCoordinator {
    func passParameter(value: Any?) {}
}

protocol Coordinating {
    var coordinator: Coordinator? { get set }
}
