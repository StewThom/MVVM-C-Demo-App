//
//  AppCoordinator.swift
//  MVVM-C Demo App
//
//  Created by Stewart Thomson on 13/08/2019.
//  Copyright © 2019 Stewart Thomson. All rights reserved.
//

import UIKit

enum HomeTransitionRef: TransitionRef {
    case Login
}

class AppCoordinator: Coordinator {
    
    init() {
        let viewController = HomeViewController.instantiateFromStoryboard(storyboard: .Home, with: HomeViewModel())
        super.init(rootViewController: viewController)
    }
    
    override func transition(_ transition: TransitionRef) {
        guard let transition = transition as? HomeTransitionRef else {
            return
        }
        
        switch transition {
        case .Login:
            login()
        }
    }
}

extension AppCoordinator {
    
    func login() {
        let loginCoordinator = LoginCoordinator()
        present(loginCoordinator)
    }
}
