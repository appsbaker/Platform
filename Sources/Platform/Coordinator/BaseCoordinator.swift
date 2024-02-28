import UIKit

open class BaseCoordinator: Coordinatable {
    public enum Routes {}
    
    public let navigationController: UINavigationController
    public var onComplete: FlowCompletion? = nil
    public private(set) var startedAtIndex: Int = 0
    
    required public init(with navigationController: UINavigationController) {
        self.navigationController = navigationController
        startedAtIndex = navigationController.viewControllers.count
    }
    
    open func route(to: Routes, animated: Bool = true) { }
    
    open func backward(animated: Bool = true) {
        navigationController.popViewController(animated: animated)
    }
    
    open func start(animated: Bool = true, onComplete: FlowCompletion? = nil) {
        fatalError("This method should be overrided, and don't called from super class.")
    }
    
    open func complete() {
        let last = navigationController.viewControllers.count - startedAtIndex
        navigationController.viewControllers.removeLast(last)
        onComplete?()
    }
}
