import UIKit

public extension UITextField {
    convenience init(borderStyle: UITextField.BorderStyle) {
        self.init()
        self.borderStyle = borderStyle
    }
}
