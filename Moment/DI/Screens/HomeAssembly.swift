//
//  HomeAssembly.swift
//  Moment
//
//  Created by Mehmet Tarhan on 24/04/2023.
//  Copyright © 2023 MEMTARHAN. All rights reserved.
//

import Swinject
import UIKit

class HomeAssembly: Assembly {
    func assemble(container: Container) {
        container.register(HomeViewController.self) { _ in
            let view = HomeViewControllerImplemented.instantiate()

            return view
        }
    }
}
