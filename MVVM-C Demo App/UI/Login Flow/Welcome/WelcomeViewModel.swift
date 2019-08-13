//
//  WelcomeViewModel.swift
//  MVVM-C Demo App
//
//  Created by Stewart Thomson on 13/08/2019.
//  Copyright © 2019 Stewart Thomson. All rights reserved.
//

import Foundation

class WelcomeViewModel: ViewModel {
    
    let username: String
    
    init(username: String) {
        self.username = username
    }
}
