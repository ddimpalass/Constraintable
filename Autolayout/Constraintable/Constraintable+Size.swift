//
//  Constraintable+Size.swift
//  Autolayout
//
//  Created by Shchelochkov_D_S on 25.09.2023.
//

import UIKit

public extension Constraintable {
    @discardableResult
    func setSize(width: CGFloat, height: CGFloat) -> Self {
        set(constraint: .width, relation: .equal, toView: nil, toConstraint: .none, multiplier: 1, constant: width, insetsFromSafeArea: false)
        set(constraint: .height, relation: .equal, toView: nil, toConstraint: .none, multiplier: 1, constant: height, insetsFromSafeArea: false)
        return self
    }
    
    @discardableResult
    func setWidth(constant: CGFloat) -> Self {
        return set(constraint: .width, relation: .equal, toView: nil, toConstraint: .none, multiplier: 1, constant: constant, insetsFromSafeArea: false)
    }
    
    @discardableResult
    func setHeight(constant: CGFloat) -> Self {
        return set(constraint: .height, relation: .equal, toView: nil, toConstraint: .none, multiplier: 1, constant: constant, insetsFromSafeArea: false)
    }
}
