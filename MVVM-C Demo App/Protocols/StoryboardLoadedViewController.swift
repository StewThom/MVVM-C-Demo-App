//
//  StoryboardLoadedViewController.swift
//  MVVM-C Demo App
//
//  Created by Stewart Thomson on 13/08/2019.
//  Copyright © 2019 Stewart Thomson. All rights reserved.
//

import UIKit

protocol StoryboardLoadedViewController: ModeledViewController {
    static func instantiateFromStoryboard(storyboard: StoryboardRef, with viewModel: ViewModel) -> Self
}

extension StoryboardLoadedViewController {
    static func instantiateFromStoryboard(storyboard: StoryboardRef, with viewModel: ViewModel) -> Self {
        let className = NSStringFromClass(self).components(separatedBy: ".")[1]
        let storyboard = UIStoryboard(name: storyboard.rawValue, bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(withIdentifier: className) as! Self
        vc.viewModel = (viewModel as! Self.AnyViewModel)
        vc.setAsDelegate(for: viewModel)
        return vc
    }
}
