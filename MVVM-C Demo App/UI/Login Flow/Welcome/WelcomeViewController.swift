//
//  WelcomeViewController.swift
//  MVVM-C Demo App
//
//  Created by Stewart Thomson on 13/08/2019.
//  Copyright © 2019 Stewart Thomson. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController, StoryboardLoadedViewController {
    
    var viewModel: WelcomeViewModel!
    
    @IBOutlet weak var welcomeBackLabel: UILabel!
    
    override func viewDidLoad() {
        welcomeBackLabel.text = String(format: NSLocalizedString("welcome_back", comment: "Welcome Back"), viewModel.username)
    }
    
    @IBAction func dismissPressed(_ sender: Any) {
        viewModel.coordinator?.dismiss()
    }
}
