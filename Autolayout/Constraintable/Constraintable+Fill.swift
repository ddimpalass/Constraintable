//
//  Constraintable+Fill.swift
//  Autolayout
//
//  Created by Shchelochkov_D_S on 25.09.2023.
//

import UIKit

public extension Constraintable {
    @discardableResult
    func fill(toView view: Constraintable? = nil, insetsFromSafeArea: Bool = false) -> Self {
        fillWidth(toView: view, insetsFromSafeArea: insetsFromSafeArea)
        fillHeight(toView: view, insetsFromSafeArea: insetsFromSafeArea)
        return self
    }
    
    @discardableResult
    func fillWidth(toView view: Constraintable? = nil, margin: CGFloat = 0, insetsFromSafeArea: Bool = false) -> Self {
        setLeading(toView: view, constant: margin, insetsFromSafeArea: insetsFromSafeArea)
        setTrailing(toView: view, constant: margin, insetsFromSafeArea: insetsFromSafeArea)
        return self
    }
    
    @discardableResult
    func fillHeight(toView view: Constraintable? = nil, margin: CGFloat = 0, insetsFromSafeArea: Bool = false) -> Self {
        setTop(toView: view, constant: margin, insetsFromSafeArea: insetsFromSafeArea)
        setBottom(toView: view, constant: margin, insetsFromSafeArea: insetsFromSafeArea)
        return self
    }
}
