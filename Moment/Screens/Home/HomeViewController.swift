//
//  HomeViewController.swift
//  Moment
//
//  Created by Mehmet Tarhan on 24/04/2023.
//  Copyright © 2023 MEMTARHAN. All rights reserved.
//

import SwiftUI
import UIKit

struct LayoutMetrics {
    static let horizontalMargin = 8.0
    static let sectionSpacing = 4.0
    static let cornerRadius = 16.0
}

private enum Section: Int, CaseIterable {
    case photos
}

struct PhotosPost: Identifiable {
    let id: UUID
    let imageName: String
}

protocol HomeViewController: AnyObject { }

class HomeViewControllerImplemented: UIViewController, NibLoadable {
    @IBOutlet var collectionView: UICollectionView!

    private var data = Array(repeating: PhotosPost(id: UUID(), imageName: "sample"), count: 100)

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    // MARK: - Actions

    @objc private func didTapAdd(_ sender: UIBarButtonItem) {
        print(#function)
    }

    // A cell registration that configures a custom list cell with a SwiftUI health category view.
    private var photoCellRegistration: UICollectionView.CellRegistration<UICollectionViewListCell, PhotosPost> = {
        .init { cell, _, item in
            print(item.imageName)
            var backgroundConfiguration = UIBackgroundConfiguration.listPlainCell()
            backgroundConfiguration.backgroundColor = .clear
            cell.backgroundConfiguration = backgroundConfiguration
            cell.contentConfiguration = UIHostingConfiguration {
                PhotosPostView()
            }
            .margins(.horizontal, LayoutMetrics.horizontalMargin)
        }
    }()
}

// MARK: - Setup

private extension HomeViewControllerImplemented {
    func setupView() {
        navigationItem.title = "Moment"

        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"),
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(didTapAdd(_:)))

        setUpCollectionView()
    }

    // Creates the collection view with a compositional layout, which contains multiple sections of different layouts.
    func setUpCollectionView() {
        let layout = UICollectionViewCompositionalLayout { [unowned self] sectionIndex, _ in
            switch Section(rawValue: sectionIndex)! {
            case .photos:
                return createListSection()
            }
        }

        collectionView.contentInsetAdjustmentBehavior = .never // To prevent space at the top at initial load
        collectionView.collectionViewLayout = layout
//        collectionView.backgroundColor = .systemGroupedBackground
//        collectionView.allowsSelection = false

        collectionView.dataSource = self
        collectionView.delegate = self
    }

    // Returns a compositional layout section for cells in a list.
    func createListSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.5))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 1)
        group.interItemSpacing = .fixed(4)

        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 4
        section.contentInsets = .zero
//        section.contentInsets.leading = LayoutMetrics.horizontalMargin
//        section.contentInsets.trailing = LayoutMetrics.horizontalMargin
//        section.contentInsets.top = LayoutMetrics.sectionSpacing
//        section.contentInsets.bottom = LayoutMetrics.sectionSpacing
        return section
    }
}

// MARK: - UICollectionViewDataSource

extension HomeViewControllerImplemented: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        Section.allCases.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch Section(rawValue: section)! {
        case .photos:
            return data.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch Section(rawValue: indexPath.section)! {
        case .photos:
            let item = data[indexPath.item]
            return collectionView.dequeueConfiguredReusableCell(using: photoCellRegistration, for: indexPath, item: item)
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(#function)
    }
}

// MARK: - HomeViewController

extension HomeViewControllerImplemented: HomeViewController { }
