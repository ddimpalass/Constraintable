//
//  UIViewExtension.swift
//  Autolayout
//
//  Created by Shchelochkov_D_S on 20.09.2023.
//

import UIKit


public enum ConstraintableAttribute: Int {
    case none
    case left
    case right
    case top
    case bottom
    case leading
    case trailing
    case width
    case height
    case centerX
    case centerY
    case lastBaseline
}

public protocol Constraintable: UIView {
    var parent: Constraintable? { get }
}

public extension Constraintable {
    @discardableResult
    func set(constraint: ConstraintableAttribute,
             relation: NSLayoutConstraint.Relation,
             toView view: UIView?,
             toConstraint: ConstraintableAttribute,
             multiplier: CGFloat,
             constant: CGFloat,
             insetsFromSafeArea: Bool) -> Self {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: self,
                           attribute: NSLayoutConstraint.Attribute(rawValue: constraint.rawValue) ?? .notAnAttribute,
                           relatedBy: relation,
                           toItem: insetsFromSafeArea ? view?.safeAreaLayoutGuide : view,
                           attribute: NSLayoutConstraint.Attribute(rawValue: toConstraint.rawValue) ?? .notAnAttribute,
                           multiplier: multiplier,
                           constant: constant).isActive = true
        return self
    }
}
