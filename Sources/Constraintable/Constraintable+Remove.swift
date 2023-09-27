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
        parent?.constraints.forEach { constraint in
            if constraint.firstItem as? Constraintable == self || constraint.secondItem as? Constraintable == self {
                parent?.removeConstraint(constraint)
            }
        }
        removeConstraints(constraints)
        return self
    }
}
