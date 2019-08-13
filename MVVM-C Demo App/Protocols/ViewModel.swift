//
//  ViewModel.swift
//  MVVM-C Demo App
//
//  Created by Stewart Thomson on 13/08/2019.
//  Copyright © 2019 Stewart Thomson. All rights reserved.
//

import Foundation

class ViewModel {
    weak var coordinator: Coordinator?
    weak var delegate: ViewModelDelegate?
}

protocol ViewModelDelegate: class {
    func viewModelDidUpdate()
    func viewModelDidError(error: Error)
}

extension ViewModelDelegate {
    func viewModelDidUpdate() {}
    func viewModelDidError(error: Error) {
        print("View model reported error (\(error)) but view controller does not conform to this method")
    }
}
