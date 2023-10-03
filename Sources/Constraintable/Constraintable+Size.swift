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
                 active: Bool = true,
                 identifier: String = #fileID,
                 line: Int = #line) -> Self {
        setWidth(constant: width,
                 priority: priority,
                 active: active,
                 identifier: identifier)
        .setHeight(constant: height,
                   priority: priority,
                   active: active,
                   identifier: identifier)
    }
    
    @discardableResult
    func setSize(equalTo view: UIView,
                 relation: NSLayoutConstraint.Relation = .equal,
                 multiplier: CGFloat = 1,
                 priority: UILayoutPriority = .required,
                 active: Bool = true,
                 identifier: String = #fileID,
                 line: Int = #line) -> Self {
        setWidth(equalTo: view,
                 relation: relation,
                 multiplier: multiplier,
                 identifier: identifier)
        .setHeight(equalTo: view,
                   relation: relation,
                   multiplier: multiplier,
                   identifier: identifier)
    }
    
    @discardableResult
    func setWidth(constant: CGFloat,
                  priority: UILayoutPriority = .required,
                  active: Bool = true,
                  identifier: String = #fileID,
                  line: Int = #line) -> Self {
        set(attribute: .width,
            relation: .equal,
            toView: nil,
            toAttribute: .none,
            constant: constant,
            insetsFromSafeArea: false,
            priority: priority,
            active: active, 
            identifier: identifier)
    }
    
    @discardableResult
    func setWidth(equalTo view: UIView,
                  attribute: ConstraintableAttribute = .width,
                  relation: NSLayoutConstraint.Relation = .equal,
                  multiplier: CGFloat = 1,
                  priority: UILayoutPriority = .required,
                  active: Bool = true,
                  identifier: String = #fileID,
                  line: Int = #line) -> Self {
        set(attribute: .width,
            relation: relation,
            toView: view,
            toAttribute: attribute,
            multiplier: multiplier,
            constant: 0,
            insetsFromSafeArea: false,
            priority: priority,
            active: active,
            identifier: identifier)
    }
    
    @discardableResult
    func setHeight(constant: CGFloat,
                   priority: UILayoutPriority = .required,
                   active: Bool = true,
                   identifier: String = #fileID,
                   line: Int = #line) -> Self {
        set(attribute: .height,
            relation: .equal,
            toView: nil,
            toAttribute: .none,
            constant: constant,
            insetsFromSafeArea: false,
            priority: priority,
            active: active,
            identifier: identifier)
    }
    
    @discardableResult
    func setHeight(equalTo view: UIView,
                   attribute: ConstraintableAttribute = .height,
                   relation: NSLayoutConstraint.Relation = .equal,
                   multiplier: CGFloat = 1,
                   priority: UILayoutPriority = .required,
                   active: Bool = true,
                   identifier: String = #fileID,
                   line: Int = #line) -> Self {
        set(attribute: .height,
            relation: relation,
            toView: view,
            toAttribute: attribute,
            multiplier: multiplier,
            constant: 0,
            insetsFromSafeArea: false,
            priority: priority,
            active: active,
            identifier: identifier)
    }
}
