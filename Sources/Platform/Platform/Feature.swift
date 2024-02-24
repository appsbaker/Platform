//
//  Feature.swift
//  Coordinator
//
//  Created by Slava Anishchuk on 21.02.2024.
//

import UIKit

typealias FlowCompletion = () -> Void

protocol Feature {
    associatedtype Coordinator
    var coordinator: Coordinator { get }
    var rootViewController: UINavigationController? { get }
    var onFlowCompletion: FlowCompletion? { get set }
    func start(animated: Bool)
}

class BaseFeature<C: Coordinatable>: Feature {
    var coordinator: C
    var rootViewController: UINavigationController?
    var onFlowCompletion: FlowCompletion?

    init(_ rootViewController: UINavigationController, onFlowCompletion: FlowCompletion? = nil) {
        self.rootViewController = rootViewController
        self.onFlowCompletion = onFlowCompletion
        coordinator = C(with: rootViewController)
    }

    func start(animated: Bool = true) {
        guard let rootViewController else { return }
        coordinator.start(animated: animated, onComplete: onFlowCompletion)
    }
}
