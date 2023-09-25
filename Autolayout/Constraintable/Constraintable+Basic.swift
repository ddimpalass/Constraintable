//
//  Constraintable+Basic.swift
//  Autolayout
//
//  Created by Shchelochkov_D_S on 20.09.2023.
//

import UIKit

public extension Constraintable {
    @discardableResult
    func setLeading(toView view: Constraintable? = nil, constant: CGFloat = 0, insetsFromSafeArea: Bool = false) -> Self {
        return set(constraint: .leading, relation: .equal, toView: view ?? parent, toConstraint: .leading, multiplier: 1, constant: constant, insetsFromSafeArea: insetsFromSafeArea)
    }
    
    @discardableResult
    func setTrailing(toView view: Constraintable? = nil, constant: CGFloat = 0, insetsFromSafeArea: Bool = false) -> Self {
        return set(constraint: .trailing, relation: .equal, toView: view ?? parent, toConstraint: .trailing, multiplier: 1, constant: -constant, insetsFromSafeArea: insetsFromSafeArea)
    }
    
    @discardableResult
    func setTop(toView view: Constraintable? = nil, constant: CGFloat = 0, insetsFromSafeArea: Bool = false) -> Self {
        return set(constraint: .top, relation: .equal, toView: view ?? parent, toConstraint: .top, multiplier: 1, constant: constant, insetsFromSafeArea: insetsFromSafeArea)
    }
    
    @discardableResult
    func setBottom(toView view: Constraintable? = nil, constant: CGFloat = 0, insetsFromSafeArea:  Bool = false) -> Self {
        return set(constraint: .bottom, relation: .equal, toView: view ?? parent, toConstraint: .bottom, multiplier: 1, constant: -constant, insetsFromSafeArea: insetsFromSafeArea)
    }
}
