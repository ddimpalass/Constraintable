//
//  Constraintable+Basic.swift
//  Autolayout
//
//  Created by Shchelochkov_D_S on 20.09.2023.
//

import UIKit

public extension Constraintable {
    @discardableResult
    func setLeading(toView view: UIView? = nil,
                    attribute: ConstraintableAttribute = .leading,
                    offset: CGFloat = 0,
                    relation: NSLayoutConstraint.Relation = .equal,
                    insetsFromSafeArea: Bool = false,
                    priority: UILayoutPriority = .required,
                    active: Bool = true,
                    identifier: String = #fileID,
                    line: Int = #line) -> Self {
        return set(attribute: .leading,
                   relation: relation,
                   toView: view ?? self.parent,
                   toAttribute: attribute,
                   constant: offset,
                   insetsFromSafeArea: insetsFromSafeArea,
                   priority: priority,
                   active: active,
                   identifier: identifier)
    }
    
    @discardableResult
    func setTrailing(toView view: UIView? = nil,
                     attribute: ConstraintableAttribute = .trailing,
                     offset: CGFloat = 0,
                     relation: NSLayoutConstraint.Relation = .equal,
                     insetsFromSafeArea: Bool = false,
                     priority: UILayoutPriority = .required,
                     active: Bool = true,
                     identifier: String = #fileID,
                     line: Int = #line) -> Self {
        set(attribute: .trailing,
            relation: relation,
            toView: view ?? self.parent,
            toAttribute: attribute,
            constant: -offset,
            insetsFromSafeArea: insetsFromSafeArea,
            priority: priority,
            active: active,
            identifier: identifier)
    }
    
    @discardableResult
    func setTop(toView view: UIView? = nil,
                attribute: ConstraintableAttribute = .top,
                offset: CGFloat = 0,
                relation: NSLayoutConstraint.Relation = .equal,
                insetsFromSafeArea: Bool = false,
                priority: UILayoutPriority = .required,
                active: Bool = true,
                identifier: String = #fileID,
                line: Int = #line) -> Self {
        set(attribute: .top,
            relation: relation,
            toView: view ?? self.parent,
            toAttribute: attribute,
            constant: offset,
            insetsFromSafeArea: insetsFromSafeArea,
            priority: priority,
            active: active,
            identifier: identifier)
    }
    
    @discardableResult
    func setBottom(toView view: UIView? = nil,
                   attribute: ConstraintableAttribute = .bottom,
                   offset: CGFloat = 0,
                   relation: NSLayoutConstraint.Relation = .equal,
                   insetsFromSafeArea:  Bool = false,
                   priority: UILayoutPriority = .required,
                   active: Bool = true,
                   identifier: String = #fileID,
                   line: Int = #line) -> Self {
        set(attribute: .bottom,
            relation: relation,
            toView: view ?? self.parent,
            toAttribute: attribute,
            constant: -offset,
            insetsFromSafeArea: insetsFromSafeArea,
            priority: priority,
            active: active,
            identifier: identifier)
    }
}
