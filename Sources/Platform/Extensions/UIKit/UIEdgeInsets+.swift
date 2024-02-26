import UIKit

public extension UIEdgeInsets {
    static func all(spacing: CGFloat) -> Self {
        return .symetry(vertical: spacing, horizontal: spacing)
    }
    
    static func symetry(vertical: CGFloat, horizontal: CGFloat) -> Self {
        return .init(
            top: vertical,
            left: horizontal,
            bottom: vertical,
            right: horizontal
        )
    }
}
