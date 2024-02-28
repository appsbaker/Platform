@available(iOS 15.0, *)
public extension Identifiable {
    static var identifier: String { String(describing: Self.self) }
}
