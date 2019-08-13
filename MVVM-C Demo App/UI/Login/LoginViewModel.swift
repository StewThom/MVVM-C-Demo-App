//
//  LoginViewModel.swift
//  MVVM-C Demo App
//
//  Created by Stewart Thomson on 13/08/2019.
//  Copyright © 2019 Stewart Thomson. All rights reserved.
//

import Foundation

enum LoginViewModelError: Error {
    case valuesMissing
}

class LoginViewModel: ViewModel {
    
    func login(withUsername username: String?, password: String?) {
        guard let username = username, let password = password else {
            delegate?.viewModelDidError(error: LoginViewModelError.valuesMissing)
            return
        }
        
        guard !username.isEmpty, !password.isEmpty else {
            delegate?.viewModelDidError(error: LoginViewModelError.valuesMissing)
            return
        }
        
        coordinator?.dismiss()
    }
}
