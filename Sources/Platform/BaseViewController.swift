//
//  BaseViewController.swift
//  Coordinator
//
//  Created by Slava Anishchuk on 22.02.2024.
//

import UIKit

open class BaseViewController<VM>: UIViewController, FeatureScene {
    public typealias ViewModel = VM
    private(set) public var viewModel: ViewModel?

    open override func viewDidLoad() {
        super.viewDidLoad()
        setupViewAndConstraints()
    }

    open func setupViewAndConstraints() {}

    open func configure(viewModel: ViewModel?) {
        self.viewModel = viewModel
    }
}
