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
                    offset: CGFloat = 0,
                    relation: NSLayoutConstraint.Relation = .equal,
                    insetsFromSafeArea: Bool = false,
                    priority: UILayoutPriority = .required,
                    active: Bool = true) -> Self {
        set(constraint: .leading,
            relation: relation,
            toView: view ?? parent,
            toConstraint: .leading,
            multiplier: 1,
            constant: offset,
            insetsFromSafeArea: insetsFromSafeArea,
            priority: priority,
            active: active)
    }
    
    @discardableResult
    func setTrailing(toView view: Constraintable? = nil,
                     offset: CGFloat = 0,
                     relation: NSLayoutConstraint.Relation = .equal,
                     insetsFromSafeArea: Bool = false,
                     priority: UILayoutPriority = .required,
                     active: Bool = true) -> Self {
        set(constraint: .trailing,
            relation: relation,
            toView: view ?? parent,
            toConstraint: .trailing,
            multiplier: 1,
            constant: -offset,
            insetsFromSafeArea: insetsFromSafeArea,
            priority: priority,
            active: active)
    }
    
    @discardableResult
    func setTop(toView view: Constraintable? = nil,
                offset: CGFloat = 0,
                relation: NSLayoutConstraint.Relation = .equal,
                insetsFromSafeArea: Bool = false,
                priority: UILayoutPriority = .required,
                active: Bool = true) -> Self {
        set(constraint: .top,
            relation: relation,
            toView: view ?? parent,
            toConstraint: .top,
            multiplier: 1,
            constant: offset,
            insetsFromSafeArea: insetsFromSafeArea,
            priority: priority,
            active: active)
    }
    
    @discardableResult
    func setBottom(toView view: Constraintable? = nil,
                   offset: CGFloat = 0,
                   relation: NSLayoutConstraint.Relation = .equal,
                   insetsFromSafeArea:  Bool = false,
                   priority: UILayoutPriority = .required,
                   active: Bool = true) -> Self {
        set(constraint: .bottom,
            relation: relation,
            toView: view ?? parent,
            toConstraint: .bottom,
            multiplier: 1,
            constant: -offset,
            insetsFromSafeArea: insetsFromSafeArea,
            priority: priority,
            active: active)
    }
}
