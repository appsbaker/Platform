//
//  File.swift
//  
//
//  Created by Slava Anishchuk on 27.02.2024.
//

import UIKit
import Combine

public extension UITextField {
    convenience init(borderStyle: UITextField.BorderStyle) {
        self.init()
        self.borderStyle = borderStyle
    }
}

// Worked example
//func bind(_ textField: UITextField,
//          to property: ReferenceWritableKeyPath<ViewModel, String?>) {
//    NotificationCenter.default.publisher(
//        for: UITextField.textDidChangeNotification,
//        object: textField
//    )
//    .sink(receiveValue: { result in
//        guard let textField = result.object as? UITextField else { return }
//        self[keyPath: property] = textField.text
//    })
//    .store(in: &cancellables)
//}
