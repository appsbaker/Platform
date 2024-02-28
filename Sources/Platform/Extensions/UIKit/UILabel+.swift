import UIKit

public extension UILabel {
    convenience init(text: String = .empty,
                     font: UIFont = .systemFont(ofSize: 17),
                     numberOfLines: Int = 0,
                     textAlignment: NSTextAlignment = .left) {
        self.init(frame: .zero)
        self.text = text
        self.font = font
        self.numberOfLines = numberOfLines
        self.textAlignment = textAlignment
    }
}
