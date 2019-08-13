//
//  Coordinator.swift
//  MVVM-C Demo App
//
//  Created by Stewart Thomson on 13/08/2019.
//  Copyright © 2019 Stewart Thomson. All rights reserved.
//

import UIKit

enum StoryboardRef: String {
    case Home
    case Login
}

protocol TransitionRef {}

class Coordinator {
    weak var parent: Coordinator?
    var children: [Coordinator] = []
    private(set) var rootViewController: UIViewController
    
    init<T: ModeledViewController>(rootViewController: T) {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.setNavigationBarHidden(true, animated: false)
        self.rootViewController = navController
        if let viewModel = rootViewController.viewModel as? ViewModel {
            viewModel.coordinator = self
        }
    }
    
    func transition(_ transition: TransitionRef) {
        fatalError("Transition method to be added to Coordinator Subclass")
    }

    final func present(_ child: Coordinator, completion: (() -> Void)? = nil) {
        child.parent = self
        self.children.append(child)
        rootViewController.present(child.rootViewController, animated: true, completion: completion)
    }
    
    final func dismiss(completion: (() -> Void)? = nil) {
        rootViewController.dismiss(animated: true) {
            self.parent?.remove(self)
            completion?()
        }
    }
    
    final func remove(_ child: Coordinator) {
        children = children.filter( { $0 !== child } )
    }
    
    final func show(_ viewController: UIViewController) {
        if let navController = rootViewController as? UINavigationController {
            navController.show(viewController, sender: self)
        }
    }
}
