//
//  ModeledViewController.swift
//  MVVM-C Demo App
//
//  Created by Stewart Thomson on 13/08/2019.
//  Copyright © 2019 Stewart Thomson. All rights reserved.
//

import UIKit

protocol ModeledViewController: UIViewController, ViewModelDelegate {
    associatedtype AnyViewModel = ViewModel
    var viewModel: AnyViewModel! { get set }
    
    func setAsDelegate(for viewModel: ViewModel)
}

extension ModeledViewController {
    
    func setAsDelegate(for viewModel: ViewModel) {
        viewModel.delegate = self
    }
}
