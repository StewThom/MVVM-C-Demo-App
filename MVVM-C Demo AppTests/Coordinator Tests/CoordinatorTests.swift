//
//  CoordinatorTests.swift
//  MVVM-C Demo AppTests
//
//  Created by Stewart Thomson on 13/08/2019.
//  Copyright © 2019 Stewart Thomson. All rights reserved.
//

import XCTest
@testable import MVVM_C_Demo_App

class TestViewController: UIViewController, ModeledViewController {
    var viewModel: ViewModel!
}

class TestCoordinator: Coordinator {
    
    let viewController: TestViewController
    
    required init() {
        viewController = TestViewController()
        super.init(rootViewController: viewController)
    }
    
    func transition(to page: TransitionRef, object: Any?) -> Bool {
        return true
    }
}

class CoordinatorTests: XCTestCase {

    func testPresentingChildCoordinator() {
        let coordinator = TestCoordinator()
        let childCoord = TestCoordinator()
        
        XCTAssertNoThrow(coordinator.present(childCoord))
        XCTAssertEqual(coordinator.children.count, 1)
        XCTAssert(childCoord.parent === coordinator)
    }
}
