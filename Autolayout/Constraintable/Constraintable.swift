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
    func set(constraint attribute: ConstraintableAttribute,
             relation: NSLayoutConstraint.Relation,
             toView view: UIView?,
             toConstraint toAttribute: ConstraintableAttribute,
             multiplier: CGFloat,
             constant: CGFloat,
             insetsFromSafeArea: Bool,
             priority: UILayoutPriority,
             active isActive: Bool) -> Self {
        self.translatesAutoresizingMaskIntoConstraints = false
        var viewAddress = ""
        if let view {
            viewAddress = "\(Unmanaged.passUnretained(view).toOpaque())"
        }
        if let constraint = constraints.first(where: { $0.identifier == "\(attribute.rawValue).\(relation.rawValue).\(viewAddress).\(attribute.rawValue).\(multiplier)" }) {
            constraint.constant = constant
            constraint.priority = priority
            constraint.isActive = isActive
        } else {
            let constraint = NSLayoutConstraint(item: self,
                                                attribute: NSLayoutConstraint.Attribute(rawValue: attribute.rawValue) ?? .notAnAttribute,
                                                relatedBy: relation,
                                                toItem: insetsFromSafeArea ? view?.safeAreaLayoutGuide : view,
                                                attribute: NSLayoutConstraint.Attribute(rawValue: toAttribute.rawValue) ?? .notAnAttribute,
                                                multiplier: multiplier,
                                                constant: constant)
            constraint.identifier = "\(attribute.rawValue).\(relation.rawValue).\(viewAddress).\(attribute.rawValue).\(multiplier)"
            constraint.priority = priority
            constraint.isActive = isActive
        }
        return self
    }
}
