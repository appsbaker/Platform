//
//  File.swift
//  
//
//  Created by Slava Anishchuk on 24.02.2024.
//

import UIKit

public extension UIStackView {
    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach { addArrangedSubview($0) }
    }
}
