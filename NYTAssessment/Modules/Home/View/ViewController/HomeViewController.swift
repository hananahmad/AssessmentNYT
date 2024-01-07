//
//  HomeViewController.swift
//  NYTAssessment
//
//  Created by Hanan on 07/01/2024.
//

import UIKit
import Combine

final class HomeViewController: UIViewController, Coordinating, Storyboardable {
    @IBOutlet private weak var collectionView: UICollectionView!
    
    private var cancellables = Set<AnyCancellable>()
    var viewModel: HomeViewModel?
    private var dataSource: HomeDataSource?
    
    var coordinator: Coordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "NY Times Most Popular"
        if let viewModel {
            dataSource = HomeDataSource(viewModel: viewModel)
        }
        setupNavbar()
        setupCollectionView()
        bindViewModel()
        bindDataSource()
        
        viewModel?.fetchMostPopularArticles()
    }

    private func setupCollectionView() {
        [MostPopularArticleCollectionViewCell.self].forEach {
            let description = String(describing: $0.self)
            collectionView.register(UINib(nibName: description, bundle: .main), forCellWithReuseIdentifier: description)
        }
        collectionView.dataSource = dataSource
        collectionView.delegate = dataSource
        if let dataSource {
            collectionView.collectionViewLayout = dataSource.createCollectionViewLayout()
        }
    }
    
    private func bindViewModel() {
        viewModel?.statePublisher.sink { [weak self] state in
            guard let self else { return }
            
            switch state {
            case .showLoader:
                AppLoader.show()
            case .hideLoader:
                AppLoader.dismiss()
            case .showError(let message):
                self.present(AppAlert.createOkDialog(with: "Error", message: message), animated: true)
            case .articlesFetched:
                self.collectionView.reloadData()
            }
        }.store(in: &cancellables)
    }
    
    private func bindDataSource() {
        dataSource?.statePublisher.sink { [weak self] state in
            guard let self else { return }
            
            switch state {
            case .cellDidTap(let article):
                self.coordinator?.navigate(to: .articleDetail(mostPopularArticle: article))
            }
        }.store(in: &cancellables)
    }
    
    private func setupNavbar() {
        let menuButton = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal"), style: .plain, target: self, action: #selector(menuButtonTapped))
        menuButton.tintColor = .label
        
        let searchButton = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(searchButtonTapped))
        searchButton.tintColor = .label
        
        let expandButton = UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: .plain, target: self, action: #selector(expandButtonTapped))
        expandButton.tintColor = .label
        
        navigationItem.leftBarButtonItems = [menuButton]
        navigationItem.rightBarButtonItems = [expandButton, searchButton]
    }
}

extension HomeViewController {
    @objc private func menuButtonTapped() {
        
    }
    
    @objc private func searchButtonTapped() {
        
    }
    
    @objc private func expandButtonTapped() {
        
    }
}

