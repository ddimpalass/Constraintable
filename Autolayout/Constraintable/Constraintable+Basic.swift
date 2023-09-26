//
//  Constraintable+Basic.swift
//  Autolayout
//
//  Created by Shchelochkov_D_S on 20.09.2023.
//

import UIKit

public extension Constraintable {
    @discardableResult
    func setLeading(toView view: Constraintable? = nil,
                    constraint: ConstraintableAttribute = .leading,
                    offset: CGFloat = 0,
                    relation: NSLayoutConstraint.Relation = .equal,
                    insetsFromSafeArea: Bool = false,
                    priority: UILayoutPriority = .required,
                    active: Bool = true) -> Self {
        set(constraint: .leading,
            relation: relation,
            toView: view ?? parent,
            toConstraint: constraint,
            constant: offset,
            insetsFromSafeArea: insetsFromSafeArea,
            priority: priority,
            active: active)
    }
    
    @discardableResult
    func setTrailing(toView view: Constraintable? = nil,
                     constraint: ConstraintableAttribute = .trailing,
                     offset: CGFloat = 0,
                     relation: NSLayoutConstraint.Relation = .equal,
                     insetsFromSafeArea: Bool = false,
                     priority: UILayoutPriority = .required,
                     active: Bool = true) -> Self {
        set(constraint: .trailing,
            relation: relation,
            toView: view ?? parent,
            toConstraint: constraint,
            constant: -offset,
            insetsFromSafeArea: insetsFromSafeArea,
            priority: priority,
            active: active)
    }
    
    @discardableResult
    func setTop(toView view: Constraintable? = nil,
                constraint: ConstraintableAttribute = .top,
                offset: CGFloat = 0,
                relation: NSLayoutConstraint.Relation = .equal,
                insetsFromSafeArea: Bool = false,
                priority: UILayoutPriority = .required,
                active: Bool = true) -> Self {
        set(constraint: .top,
            relation: relation,
            toView: view ?? parent,
            toConstraint: constraint,
            constant: offset,
            insetsFromSafeArea: insetsFromSafeArea,
            priority: priority,
            active: active)
    }
    
    @discardableResult
    func setBottom(toView view: Constraintable? = nil,
                   constraint: ConstraintableAttribute = .bottom,
                   offset: CGFloat = 0,
                   relation: NSLayoutConstraint.Relation = .equal,
                   insetsFromSafeArea:  Bool = false,
                   priority: UILayoutPriority = .required,
                   active: Bool = true) -> Self {
        set(constraint: .bottom,
            relation: relation,
            toView: view ?? parent,
            toConstraint: constraint,
            constant: -offset,
            insetsFromSafeArea: insetsFromSafeArea,
            priority: priority,
            active: active)
    }
}
