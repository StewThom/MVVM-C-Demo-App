//
//  AppCoordinator.swift
//  MVVM-C Demo App
//
//  Created by Stewart Thomson on 13/08/2019.
//  Copyright © 2019 Stewart Thomson. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    
    init() {
        super.init(rootViewController: UIViewController())
        rootViewController.view.backgroundColor = .red
    }
}
