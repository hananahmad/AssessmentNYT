//
//  ArticleDetailViewController.swift
//  NYTAssessment
//
//  Created by Hanan on 07/01/2024.
//

import UIKit
import Combine

final class ArticleDetailViewController: UIViewController, Coordinating {
    @IBOutlet private weak var collectionView: UICollectionView!
    
    var viewModel: ArticleDetailViewModel?
    private var dataSource: ArticleDetailDataSource?
    var coordinator: Coordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let viewModel {
            dataSource = ArticleDetailDataSource(viewModel: viewModel)
        }
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        [ArticleImageCollectionViewCell.self, ArticleDetailCollectionViewCell.self].forEach {
            let description = String(describing: $0.self)
            collectionView.register(UINib(nibName: description, bundle: .main), forCellWithReuseIdentifier: description)
        }
        collectionView.dataSource = dataSource
        collectionView.delegate = dataSource
        if let dataSource {
            collectionView.collectionViewLayout = dataSource.createCollectionViewLayout()
        }
    }
}

extension ArticleDetailViewController {
    static func create() -> ArticleDetailViewController {
        let viewController = ArticleDetailViewController(nibName: String(describing: ArticleDetailViewController.self), bundle: .main)
        return viewController
    }
}
