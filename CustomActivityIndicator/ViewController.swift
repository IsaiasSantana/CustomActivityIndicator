//
//  ViewController.swift
//  CustomActivityIndicator
//
//  Created by Isaías Santana on 24/09/19.
//  Copyright © 2019 Isaías Santana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let activityIndicatorManager = ActivityIndicatorManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
       show()
    }
    
    private func show() {
        activityIndicatorManager.startAnimation()
        stop()
    }
    
    private func stop() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.activityIndicatorManager.stopAnimation {
                 self?.show()
            }
        }
    }
}

