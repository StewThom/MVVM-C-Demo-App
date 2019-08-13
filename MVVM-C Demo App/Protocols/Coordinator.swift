//
//  Coordinator.swift
//  MVVM-C Demo App
//
//  Created by Stewart Thomson on 13/08/2019.
//  Copyright © 2019 Stewart Thomson. All rights reserved.
//

import UIKit

class Coordinator {
    weak var parent: Coordinator?
    var children: [Coordinator] = []
    private(set) var rootViewController: UIViewController
    
    init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
    }
}

extension Coordinator {
    
    func present(_ child: Coordinator, completion: (() -> Void)? = nil) {
        child.parent = self
        self.children.append(child)
        rootViewController.present(child.rootViewController, animated: true, completion: completion)
    }
    
    func dismiss(completion: (() -> Void)? = nil) {
        rootViewController.dismiss(animated: true) {
            self.parent?.remove(self)
            completion?()
        }
    }
    
    func remove(_ child: Coordinator) {
        children = children.filter( { $0 !== child } )
    }
}
