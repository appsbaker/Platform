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
        view.backgroundColor = .init(named: "background.primary")
        setupViewAndConstraints()
        binding()
        addActions()
    }

    open func binding() {}
    open func addActions() {}
    open func setupViewAndConstraints() {}

    public func configure(viewModel: ViewModel?) {
        self.viewModel = viewModel
    }
    
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
