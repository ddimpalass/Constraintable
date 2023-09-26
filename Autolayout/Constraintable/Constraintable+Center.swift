//
//  Constraintable+Center.swift
//  Autolayout
//
//  Created by Shchelochkov_D_S on 25.09.2023.
//

import UIKit

public extension Constraintable {
    @discardableResult
    func setCenter(toView view: Constraintable? = nil,
                   offsetX: CGFloat = 0,
                   offsetY: CGFloat = 0,
                   insetsFromSafeArea: Bool = false,
                   priority: UILayoutPriority = .required,
                   active: Bool = true) -> Self {
        setCenterX(toView: view, 
                   offset: offsetX,
                   insetsFromSafeArea: insetsFromSafeArea,
                   priority: priority,
                   active: active)
        .setCenterY(toView: view, 
                    offset: offsetY,
                    insetsFromSafeArea: insetsFromSafeArea,
                    priority: priority,
                    active: active)
    }
    
    @discardableResult
    func setCenterX(toView view: Constraintable? = nil,
                    offset: CGFloat = 0,
                    insetsFromSafeArea: Bool = false,
                    priority: UILayoutPriority = .required,
                    active: Bool = true) -> Self {
        set(constraint: .centerX,
            relation: .equal,
            toView: view ?? parent,
            toConstraint: .centerX,
            multiplier: 1,
            constant: offset,
            insetsFromSafeArea: insetsFromSafeArea,
            priority: priority,
            active: active)
    }
    
    @discardableResult
    func setCenterY(toView view: Constraintable? = nil,
                    offset: CGFloat = 0,
                    insetsFromSafeArea: Bool = false,
                    priority: UILayoutPriority = .required,
                    active: Bool = true) -> Self {
        set(constraint: .centerY,
            relation: .equal,
            toView: view ?? parent,
            toConstraint: .centerY,
            multiplier: 1,
            constant: offset,
            insetsFromSafeArea: insetsFromSafeArea,
            priority: priority,
            active: active)
    }
}
