//
//  File.swift
//  
//
//  Created by Slava Anishchuk on 26.02.2024.
//

@available(iOS 15.0, *)
public extension Identifiable {
    static var identifier: String { String(describing: Self.self) }
}
