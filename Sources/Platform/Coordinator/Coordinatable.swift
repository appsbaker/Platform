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
