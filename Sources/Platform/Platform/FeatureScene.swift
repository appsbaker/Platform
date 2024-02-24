//
//  FeatureScene.swift
//  Coordinator
//
//  Created by Slava Anishchuk on 21.02.2024.
//

import UIKit

public protocol FeatureScene where Self: UIViewController {
    associatedtype ViewModel
    var viewModel: ViewModel? { get }
    func configure(viewModel: ViewModel?)
}
