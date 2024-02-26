import UIKit

public extension UILabel {
    convenience init(text: String = .empty,
                     font: UIFont = .init(),
                     numberOfLines: Int = 0,
                     textAlignment: NSTextAlignment = .left) {
        self.init(frame: .zero)
        self.font = font
        self.numberOfLines = numberOfLines
        self.textAlignment = textAlignment
    }
}
