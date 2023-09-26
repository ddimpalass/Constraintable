//
//  Constraintable+Size.swift
//  Autolayout
//
//  Created by Shchelochkov_D_S on 25.09.2023.
//

import UIKit

public extension Constraintable {
    @discardableResult
    func setSize(width: CGFloat, height: CGFloat, priority: UILayoutPriority = .required) -> Self {
        setWidth(constant: width, priority: priority)
        setHeight(constant: height, priority: priority)
        return self
    }
    
    @discardableResult
    func setWidth(constant: CGFloat, priority: UILayoutPriority = .required) -> Self {
        return set(constraint: .width, 
                   relation: .equal,
                   toView: nil,
                   toConstraint: .none,
                   multiplier: 1,
                   constant: constant,
                   insetsFromSafeArea: false,
                   priority: priority)
    }
    
    @discardableResult
    func setHeight(constant: CGFloat, priority: UILayoutPriority = .required) -> Self {
        return set(constraint: .height,
                   relation: .equal,
                   toView: nil,
                   toConstraint: .none,
                   multiplier: 1,
                   constant: constant,
                   insetsFromSafeArea: false,
                   priority: priority)
    }
}
