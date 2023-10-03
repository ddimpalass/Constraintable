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
            if constraint.firstItem as? UIView == constraintableView || constraint.secondItem as? UIView == constraintableView {
                parent?.removeConstraint(constraint)
            }
        }
        constraintableView.removeConstraints(constraintableView.constraints)
        return self
    }
}
