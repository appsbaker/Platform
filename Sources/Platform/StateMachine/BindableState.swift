//
//  File.swift
//  
//
//  Created by Slava Anishchuk on 28.02.2024.
//

import UIKit
import Combine

@available(iOS 15.0, *)
public protocol BindableState: AnyObject {
    associatedtype State: ObservableObject
    var state: State { get }
    func bind(_ textField: UITextField, 
              to property: ReferenceWritableKeyPath<State, String?>,
              handler: ((String?)->Void)?) -> AnyCancellable
}

@available(iOS 15.0, *)
public extension BindableState {
    func bind(_ textField: UITextField, 
              to property: ReferenceWritableKeyPath<State, String?>,
              handler: ((String?)->Void)? = nil) -> AnyCancellable {
        NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: textField)
        .sink(receiveValue: { [weak self] result in
            guard let self, let textField = result.object as? UITextField else { return }
            self.state[keyPath: property] = textField.text
            handler?(textField.text)
        })
    }
}
