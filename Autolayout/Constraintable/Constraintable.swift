//
//  UIViewExtension.swift
//  Autolayout
//
//  Created by Shchelochkov_D_S on 20.09.2023.
//

import UIKit


public enum ConstraintableAttribute: Int {
    case left = 1
    case right = 2
    case top = 3
    case bottom = 4
    case leading = 5
    case trailing = 6
    case width = 7
    case height = 8
    case centerX = 9
    case centerY = 10
    case lastBaseline = 11
}

public protocol Constraintable: UIView {
    var parent: Constraintable? { get }
}

public extension Constraintable {
    @discardableResult
    func set(constraint: ConstraintableAttribute,
             relation: NSLayoutConstraint.Relation,
             toView: UIView?,
             toConstraint: ConstraintableAttribute,
             multiplier: CGFloat,
             constant: CGFloat) -> Self {
        NSLayoutConstraint(item: self,
                           attribute: NSLayoutConstraint.Attribute(rawValue: constraint.rawValue) ?? .notAnAttribute,
                           relatedBy: relation,
                           toItem: toView,
                           attribute: NSLayoutConstraint.Attribute(rawValue: toConstraint.rawValue) ?? .notAnAttribute,
                           multiplier: multiplier,
                           constant: constant).isActive = true
        return self
    }
}
