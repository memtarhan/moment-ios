//
//  ViewControllerFactory.swift
//  Moment
//
//  Created by Mehmet Tarhan on 24/04/2023.
//  Copyright © 2023 MEMTARHAN. All rights reserved.
//

import Foundation
import Swinject

protocol ViewControllerFactory: AnyObject {
    var home: HomeViewController { get }
}

class ViewControllerFactoryImplemented: ViewControllerFactory {
    private let assembler: Assembler

    init(assembler: Assembler) {
        self.assembler = assembler
    }

    var home: HomeViewController { assembler.resolver.resolve(HomeViewController.self)! }
}
