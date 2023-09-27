//
//  Constraintable+Size.swift
//  Autolayout
//
//  Created by Shchelochkov_D_S on 25.09.2023.
//

import UIKit

public extension Constraintable {
    @discardableResult
    func setSize(width: CGFloat,
                 height: CGFloat,
                 priority: UILayoutPriority = .required,
                 active: Bool = true) -> Self {
        setWidth(constant: width,
                 priority: priority,
                 active: active)
        .setHeight(constant: height,
                   priority: priority,
                   active: active)
    }
    
    @discardableResult
    func setSize(equalTo view: UIView,
                 relation: NSLayoutConstraint.Relation = .equal,
                 multiplier: CGFloat = 1,
                 priority: UILayoutPriority = .required,
                 active: Bool = true) -> Self {
        setWidth(equalTo: view,
                 relation: relation,
                 multiplier: multiplier)
        .setHeight(equalTo: view,
                   relation: relation,
                   multiplier: multiplier)
    }

    @discardableResult
    func setWidth(constant: CGFloat,
                  priority: UILayoutPriority = .required,
                  active: Bool = true) -> Self {
        set(attribute: .width,
            relation: .equal,
            toView: nil,
            toAttribute: .none,
            constant: constant,
            insetsFromSafeArea: false,
            priority: priority,
            active: active)
    }
    
    @discardableResult
    func setWidth(equalTo view: UIView,
                  attribute: ConstraintableAttribute = .width,
                  relation: NSLayoutConstraint.Relation = .equal,
                  multiplier: CGFloat = 1,
                  priority: UILayoutPriority = .required,
                  active: Bool = true) -> Self {
        set(attribute: .width,
            relation: relation,
            toView: view,
            toAttribute: attribute,
            multiplier: multiplier,
            constant: 0,
            insetsFromSafeArea: false,
            priority: priority,
            active: active)
    }
    
    @discardableResult
    func setHeight(constant: CGFloat,
                   priority: UILayoutPriority = .required,
                   active: Bool = true) -> Self {
        set(attribute: .height,
            relation: .equal,
            toView: nil,
            toAttribute: .none,
            constant: constant,
            insetsFromSafeArea: false,
            priority: priority,
            active: active)
    }
    
    @discardableResult
    func setHeight(equalTo view: UIView,
                   attribute: ConstraintableAttribute = .height,
                   relation: NSLayoutConstraint.Relation = .equal,
                   multiplier: CGFloat = 1,
                   priority: UILayoutPriority = .required,
                   active: Bool = true) -> Self {
        set(attribute: .height,
            relation: relation,
            toView: view,
            toAttribute: attribute,
            multiplier: multiplier,
            constant: 0,
            insetsFromSafeArea: false,
            priority: priority,
            active: active)
    }
}
