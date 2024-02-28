import UIKit

public extension UIStackView {
    convenience init(
        axis: NSLayoutConstraint.Axis = .vertical,
        distribution: UIStackView.Distribution = .fill,
        spacing: CGFloat = 16
    ) {
        self.init()
        self.axis = axis
        self.distribution = distribution
        self.spacing = spacing
    }
    
    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach { addArrangedSubview($0) }
    }
}
