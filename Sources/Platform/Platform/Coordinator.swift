//
//  Coordinator.swift
//  Coordinator
//
//  Created by Slava Anishchuk on 19.02.2024.
//

import UIKit

protocol Coordinatable: AnyObject {
    associatedtype Routes
    var onComplete: FlowCompletion? { get set }
    var navigationController: UINavigationController { get }

    init(with navigationController: UINavigationController)

    func route(to: Routes, animated: Bool)
    func complete()
    func start(animated: Bool, onComplete: FlowCompletion?)
}

class BaseCoordinator: Coordinatable {
    enum Routes {}

    let navigationController: UINavigationController
    var onComplete: FlowCompletion? = nil
    private(set) var startedAtIndex: Int = 0

    required init(with navigationController: UINavigationController) {
        self.navigationController = navigationController
        startedAtIndex = navigationController.viewControllers.count
    }

    func route(to _: Routes, animated _: Bool = true) {}

    func backward(animated: Bool = true) {
        navigationController.popViewController(animated: animated)
    }

    func start(animated _: Bool = true,
               onComplete: FlowCompletion? = nil)
    {
        self.onComplete = onComplete
    }

    func complete() {
        let last = navigationController.viewControllers.count - startedAtIndex
        navigationController.viewControllers.removeLast(last)
        onComplete?()
    }
}
