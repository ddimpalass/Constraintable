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
    func setWidth(constant: CGFloat, 
                  priority: UILayoutPriority = .required,
                  active: Bool = true) -> Self {
        set(constraint: .width,
            relation: .equal,
            toView: nil,
            toConstraint: .none,
            multiplier: 1,
            constant: constant,
            insetsFromSafeArea: false,
            priority: priority,
            active: active)
    }
    
    @discardableResult
    func setHeight(constant: CGFloat, 
                   priority: UILayoutPriority = .required,
                   active: Bool = true) -> Self {
        set(constraint: .height,
            relation: .equal,
            toView: nil,
            toConstraint: .none,
            multiplier: 1,
            constant: constant,
            insetsFromSafeArea: false,
            priority: priority,
            active: active)
    }
}
