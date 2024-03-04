//
//  File.swift
//  
//
//  Created by Slava Anishchuk on 28.02.2024.
//

import Combine

@available(iOS 15, *)
public protocol StateMachine {
    associatedtype Action
    associatedtype State: ObservableObject

    var state: State { get }
    func action(_ action: Action)
}
