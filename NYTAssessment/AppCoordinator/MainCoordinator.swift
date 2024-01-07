//
//  MainCoordinator.swift
//  NYTAssessment
//
//  Created by Hanan on 07/01/2024.
//

import UIKit

class MainCoordinator: NSObject, ParentCoordinator, UINavigationControllerDelegate {
    var navigationController: UINavigationController?
    var children: [Coordinator] = []
    
    func navigate(to childCoordinator: ChildCoordinatorFactory) {
        switch childCoordinator {
        case .articleDetail(let mostPopularArticle):
            let dependency = ArticleDetailDependency(mostPopularArticle: mostPopularArticle)
            let coordinator = ArticleDetailCoordinator(navigationController)
            coordinator.parentCoordinator = self
            coordinator.passParameter(value: dependency)
            children.append(coordinator)
            
            coordinator.start()
        }
    }
    
    func start() {
        let homeViewController = HomeConfigurator.configureHomeViewController()
        homeViewController.coordinator = self
        
        navigationController?.delegate = self
        navigationController?.setViewControllers([homeViewController], animated: false)
    }
}

extension MainCoordinator {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        // Read the view controller we’re moving from.
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }

        // Check whether our view controller array already contains that view controller. If it does it means we’re pushing a different view controller on top rather than popping it, so exit.
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }

        if let articleDetailViewController = fromViewController as? ArticleDetailViewController {
            childDidFinish(articleDetailViewController.coordinator)
        }
    }
}
