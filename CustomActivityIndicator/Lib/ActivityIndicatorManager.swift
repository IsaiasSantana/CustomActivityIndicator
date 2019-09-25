//
//  ActivityIndicatorManager.swift
//  CustomActivityIndicator
//
//  Created by Isaías Santana on 24/09/19.
//  Copyright © 2019 Isaías Santana. All rights reserved.
//

import UIKit
final class ActivityIndicatorManager: NSObject {
    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        return view
    }()
    
    private lazy var indicatorView: ActivityIndicatorView = {
        let view = ActivityIndicatorView()
        view.hideContent()
        return view
    }()
    
    func startAnimation() {
        if let window = UIApplication.shared.keyWindow {
            backgroundView.frame = window.frame
            backgroundView.alpha = 0
            window.addSubview(backgroundView)
            indicatorView.pin(at: window)
            UIView.animate(withDuration: 0.5, animations: {
                self.backgroundView.alpha = 1
            }, completion: { _ in
                self.indicatorView.showContent()
            })
        }
    }
    
    func stopAnimation(completion: (()-> Void)? = nil ) {
        UIView.animate(withDuration: 0.5, animations: { [weak self] in
            self?.backgroundView.alpha = 0
            }, completion: { [weak self] _ in
                self?.deallocViews()
                completion?()
        })
    }
    
    private func deallocViews() {
        backgroundView.removeFromSuperview()
        indicatorView.removeFromSuperview()
    }
    
    deinit {
        deallocViews()
    }
}
