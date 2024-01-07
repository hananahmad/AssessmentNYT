//
//  ArticleDetailCoordinator.swift
//  NYTAssessment
//
//  Created by Hanan on 07/01/2024.
//

import UIKit

final class ArticleDetailCoordinator: ChildCoordinator {
    weak var parentCoordinator: ParentCoordinator?
    var navigationController: UINavigationController?
    
    private var dependency: ArticleDetailDependency?
    
    init(_ navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    func start() {
        if let dependency {
            let viewController = ArticleDetailConfigurator.configureArticleDetailViewController(with: dependency)
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    func popCoordinator() {
        navigationController?.popViewController(animated: true)
        parentCoordinator?.childDidFinish(self)
    }
    
    func passParameter(value: Any?) {
        if let parameter = value as? ArticleDetailDependency {
            self.dependency = parameter
        }
    }
}
