//
//  LoginCoordinator.swift
//  MVVM-C Demo App
//
//  Created by Stewart Thomson on 13/08/2019.
//  Copyright © 2019 Stewart Thomson. All rights reserved.
//

import Foundation

enum LoginTransitionRef: TransitionRef {
    case Welcome(username: String)
}

class LoginCoordinator: Coordinator {
    
    init() {
        let viewController = LoginViewController.instantiateFromStoryboard(storyboard: .Login, with: LoginViewModel())
        super.init(rootViewController: viewController)
    }
    
    override func transition(_ transition: TransitionRef) {
        guard let transition = transition as? LoginTransitionRef else {
            return
        }
        
        switch transition {
        case .Welcome(let username):
            welcome(username: username)
        }
    }
}

extension LoginCoordinator {
    
    func welcome(username: String) {
        let viewController = WelcomeViewController.instantiateFromStoryboard(storyboard: .Login, with: WelcomeViewModel(username: username), coordinator: self)
        show(viewController)
    }
}
