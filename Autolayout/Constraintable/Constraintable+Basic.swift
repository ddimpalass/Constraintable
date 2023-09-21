//
//  Constraintable+Basic.swift
//  Autolayout
//
//  Created by Shchelochkov_D_S on 20.09.2023.
//

import UIKit

public extension Constraintable {
    @discardableResult
    func setLeading(constant: CGFloat = 0) -> Self {
        return set(constraint: .leading, relation: .equal, toView: parent, toConstraint: .leading, multiplier: 1, constant: constant)
    }
    
    @discardableResult
    func setTrailing(constant: CGFloat = 0) -> Self {
        return set(constraint: .trailing, relation: .equal, toView: parent, toConstraint: .trailing, multiplier: 1, constant: -constant)
    }
    
    @discardableResult
    func setTop(constant: CGFloat = 0) -> Self {
        return set(constraint: .top, relation: .equal, toView: parent, toConstraint: .top, multiplier: 1, constant: constant)
    }
    
    @discardableResult
    func setBottom(constant: CGFloat = 0) -> Self {
        return set(constraint: .bottom, relation: .equal, toView: parent, toConstraint: .bottom, multiplier: 1, constant: -constant)
    }
}
