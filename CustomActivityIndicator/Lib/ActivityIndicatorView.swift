//
//  ActivityIndicatorView.swift
//  CustomActivityIndicator
//
//  Created by Isaías Santana on 24/09/19.
//  Copyright © 2019 Isaías Santana. All rights reserved.
//

import UIKit

final class ActivityIndicatorView: UIView {
    private lazy var indicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .whiteLarge)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.startAnimating()
        return indicator
    }()
    
    private lazy var lbDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Loading..."
        label.font = .systemFont(ofSize: 20)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private lazy var stackViewContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .center
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupStackView() {
        addSubview(stackViewContainer)
        NSLayoutConstraint.activate([stackViewContainer.topAnchor.constraint(equalTo: topAnchor),
                                     stackViewContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
                                     trailingAnchor.constraint(equalTo: stackViewContainer.trailingAnchor),
                                     bottomAnchor.constraint(equalTo: stackViewContainer.bottomAnchor)])
        
        stackViewContainer.addArrangedSubview(indicator)
        stackViewContainer.addArrangedSubview(lbDescription)
    }
    
    private func initViews() {
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
        setupStackView()
    }
    
    func pin(at view: UIView) {
        view.addSubview(self)
        NSLayoutConstraint.activate([centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     centerYAnchor.constraint(equalTo: view.centerYAnchor)])
    }
    
    private func showContent(_ isToShow: Bool) {
        indicator.isHidden = !isToShow
        lbDescription.isHidden = !isToShow
        if isToShow {
            indicator.startAnimating()
        } else {
            indicator.stopAnimating()
        }
    }
    
    func showContent() {
        showContent(true)
    }
    
    func hideContent() {
        showContent(false)
    }
    
}
