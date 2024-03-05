//
//  Feature.swift
//  Coordinator
//
//  Created by Slava Anishchuk on 21.02.2024.
//

import UIKit

public typealias FlowCompletion = () -> Void

public protocol Feature {
    associatedtype Coordinator
    var coordinator: Coordinator { get }
    var rootViewController: UINavigationController? { get }
    var onFlowCompletion: FlowCompletion? { get set }
    func start(animated: Bool)
}

open class BaseFeature<C: Coordinatable>: Feature {
    public var coordinator: C
    public var rootViewController: UINavigationController?
    public var onFlowCompletion: FlowCompletion?

    public init(_ rootViewController: UINavigationController, onFlowCompletion: FlowCompletion? = nil) {
        self.rootViewController = rootViewController
        self.onFlowCompletion = onFlowCompletion
        coordinator = C(with: rootViewController)
    }

    open func start(animated: Bool = true) {
        coordinator.start(animated: animated, onComplete: onFlowCompletion)
    }
}
