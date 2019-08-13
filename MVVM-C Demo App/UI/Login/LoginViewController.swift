//
//  LoginViewController.swift
//  MVVM-C Demo App
//
//  Created by Stewart Thomson on 13/08/2019.
//  Copyright © 2019 Stewart Thomson. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, StoryboardLoadedViewController {
    
    var viewModel: LoginViewModel!
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBAction func loginPressed(_ sender: Any) {
        errorLabel.isHidden = true
        viewModel.login(withUsername: usernameTextField.text, password: passwordTextField.text)
    }
    
    func viewModelDidError(error: Error) {
        if let error = error as? LoginViewModelError {
            switch error {
            case .valuesMissing:
                errorLabel.text = NSLocalizedString("missing_info", comment: "Missing values")
                errorLabel.isHidden = false
            }
        }
    }
}
