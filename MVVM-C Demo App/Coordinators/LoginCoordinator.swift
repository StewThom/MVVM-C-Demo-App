//
//  LoginCoordinator.swift
//  MVVM-C Demo App
//
//  Created by Stewart Thomson on 13/08/2019.
//  Copyright © 2019 Stewart Thomson. All rights reserved.
//

import Foundation

class LoginCoordinator: Coordinator {
    
    init() {
        let viewController = LoginViewController.instantiateFromStoryboard(storyboard: .Login, with: LoginViewModel())
        super.init(rootViewController: viewController)
    }
}
