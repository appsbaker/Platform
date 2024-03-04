import UIKit
import Combine

@available(iOS 15.0, *)
public extension UITableView {
    func rowsSubscriber<Items>(_ source: UITableViewController) -> AnySubscriber<Items, Never>
        where Items: RandomAccessCollection,
              Items: Equatable {
                  source.tableView = self
                  dataSource = source

                  return AnySubscriber<Items, Never>(
                    receiveSubscription: { _ in },
                    receiveValue: { [weak self] items -> Subscribers.Demand in
                        guard let self = self else { return .none }
                        self.reloadData()
                        return .unlimited
                    }
                  )
    }
}
