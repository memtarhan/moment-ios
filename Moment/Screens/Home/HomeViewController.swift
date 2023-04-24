//
//  HomeViewController.swift
//  Moment
//
//  Created by Mehmet Tarhan on 24/04/2023.
//  Copyright © 2023 MEMTARHAN. All rights reserved.
//

import UIKit

protocol HomeViewController: AnyObject { }

class HomeViewControllerImplemented: UIViewController, NibLoadable {
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    // MARK: - Actions

    @objc private func didTapAdd(_ sender: UIBarButtonItem) {
        print(#function)
    }
}

// MARK: - Setup

private extension HomeViewControllerImplemented {
    func setupView() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Moment"

        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"),
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(didTapAdd(_:)))
    }
}

// MARK: - HomeViewController

extension HomeViewControllerImplemented: HomeViewController { }
