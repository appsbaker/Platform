//
//  BaseViewController.swift
//  Coordinator
//
//  Created by Slava Anishchuk on 22.02.2024.
//

import UIKit

class BaseViewController<VM>: UIViewController, FeatureScene {
    typealias ViewModel = VM
    private(set) var viewModel: ViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewAndConstraints()
    }

    func setupViewAndConstraints() {}

    func configure(viewModel: ViewModel?) {
        self.viewModel = viewModel
    }
}
