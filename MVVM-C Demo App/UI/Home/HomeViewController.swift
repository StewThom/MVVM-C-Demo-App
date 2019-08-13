//
//  ViewController.swift
//  MVVM-C Demo App
//
//  Created by Stewart Thomson on 13/08/2019.
//  Copyright © 2019 Stewart Thomson. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, StoryboardLoadedViewController {
    
    var viewModel: HomeViewModel!

    @IBAction func loginPressed(_ sender: Any) {
        viewModel.loginPressed()
    }
}

