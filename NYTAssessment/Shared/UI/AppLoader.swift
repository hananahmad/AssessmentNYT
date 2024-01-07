//
//  AppLoader.swift
//  NYTAssessment
//
//  Created by Hanan on 07/01/2024.
//

import UIKit
import NVActivityIndicatorView

final class AppLoader {
    private static var keyWindow: UIWindow? {
        return UIApplication.shared.connectedScenes
            .compactMap({ $0 as? UIWindowScene })
            .first?.windows
            .filter({ $0.isKeyWindow }).first
    }
    
    static func show() {
        if let keyWindow {
            guard !keyWindow.subviews.contains(where: { $0 is BlockingActivityIndicator }) else { return }
            
            let activityIndicator = BlockingActivityIndicator()
            activityIndicator.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            activityIndicator.frame = keyWindow.bounds
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                keyWindow.addSubview(activityIndicator)
            }
        }
    }
    
    static func dismiss() {
        if let keyWindow {
            keyWindow.subviews.filter {
                $0 is BlockingActivityIndicator
            }.forEach { view in
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    view.removeFromSuperview()
                }
            }
        }
    }
}

final class BlockingActivityIndicator: UIView {
    private let loaderColor = UIColor(red: 135.0 / 255.0, green: 84.0 / 255.0, blue: 161.0 / 255.0, alpha: 1.0)
    private let containerStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 12
        view.alignment = .fill
        view.distribution = .fill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let activityIndicator: NVActivityIndicatorView
    
    override init(frame: CGRect) {
        activityIndicator = NVActivityIndicatorView(frame: CGRect(origin: .zero, size: CGSize(width: 60, height: 60)))
        activityIndicator.type = .ballClipRotate
        activityIndicator.color = loaderColor
        activityIndicator.startAnimating()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        super.init(frame: frame)
        backgroundColor = .white.withAlphaComponent(0.75)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        containerStackView.addArrangedSubview(activityIndicator)
        addSubview(containerStackView)
        
        NSLayoutConstraint.activate([
            containerStackView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            containerStackView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            containerStackView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 1.2)
        ])
    }
}
