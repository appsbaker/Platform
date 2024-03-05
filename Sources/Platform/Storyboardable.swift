//
//  Storyboardable.swift
//  Coordinator
//
//  Created by Slava Anishchuk on 19.02.2024.
//

import UIKit

public typealias AnyFeatureScene = (any FeatureScene)

public protocol Storyboardable {
    static var storyboardName: String { get }
    static var classIdentifier: String { get }
    static var storyboardInstantiate: Self { get }
}

public extension Storyboardable {
    static var storyboardName: String { String(describing: Self.self) }
    static var classIdentifier: String { String(describing: Self.self) }
    static var storyboardInstantiate: Self {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: classIdentifier) as! Self
    }
}
