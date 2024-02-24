//
//  Coordinator.swift
//  Coordinator
//
//  Created by Slava Anishchuk on 19.02.2024.
//

import UIKit

public protocol Coordinatable: AnyObject {
    associatedtype Routes
    var onComplete: FlowCompletion? { get set }
    var navigationController: UINavigationController { get }

    init(with navigationController: UINavigationController)

    func route(to: Routes, animated: Bool)
    func complete()
    func start(animated: Bool, onComplete: FlowCompletion?)
}

open class BaseCoordinator: Coordinatable {
    public enum Routes {}

    public let navigationController: UINavigationController
    public var onComplete: FlowCompletion? = nil
    public private(set) var startedAtIndex: Int = 0

    required public init(with navigationController: UINavigationController) {
        self.navigationController = navigationController
        startedAtIndex = navigationController.viewControllers.count
    }

    open func route(to _: Routes, animated _: Bool = true) {}

    open func backward(animated: Bool = true) {
        navigationController.popViewController(animated: animated)
    }

    open func start(animated _: Bool = true, onComplete: FlowCompletion? = nil) {
        self.onComplete = onComplete
    }

    open func complete() {
        let last = navigationController.viewControllers.count - startedAtIndex
        navigationController.viewControllers.removeLast(last)
        onComplete?()
    }
}