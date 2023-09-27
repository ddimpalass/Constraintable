//
//  Constraintable+Remove.swift
//  Autolayout
//
//  Created by Shchelochkov_D_S on 26.09.2023.
//

import UIKit

public extension Constraintable {
    @discardableResult
    func removeAllConstraints() -> Self {
        removeConstraints(constraints)
        return self
    }
}
