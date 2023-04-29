//
//  NibLoadable.swift
//  Moment
//
//  Created by Mehmet Tarhan on 24/04/2023.
//  Copyright © 2023 MEMTARHAN. All rights reserved.
//

import UIKit

protocol NibLoadable {
    static func instantiate() -> Self
}

extension NibLoadable where Self: UIViewController {
    /**
     Instantiates a view controller from a nib with the same name
     */
    static func instantiate() -> Self {
        let nibName = NSStringFromClass(self)
            .components(separatedBy: ".")[1]
            .replacingOccurrences(of: "Implemented", with: "", options: [.caseInsensitive, .regularExpression])

        return Self(nibName: nibName, bundle: nil)
    }
}
