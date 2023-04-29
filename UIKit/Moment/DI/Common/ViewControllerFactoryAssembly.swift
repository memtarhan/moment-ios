//
//  ViewControllerFactoryAssembly.swift
//  Moment
//
//  Created by Mehmet Tarhan on 24/04/2023.
//  Copyright © 2023 MEMTARHAN. All rights reserved.
//

import Foundation
import Swinject

class ViewControllerFactoryAssembly: Assembly {
    private let assembler: Assembler

    init(assembler: Assembler) {
        self.assembler = assembler
    }

    func assemble(container: Container) {
        container.register(ViewControllerFactory.self) { _ in
            ViewControllerFactoryImplemented(assembler: self.assembler)
        }
    }
}
