//
//  Constraintable+Center.swift
//  Autolayout
//
//  Created by Shchelochkov_D_S on 25.09.2023.
//

import UIKit

public extension Constraintable {
    @discardableResult
    func setCenter(toView view: UIView? = nil,
                   offsetX: CGFloat = 0,
                   offsetY: CGFloat = 0,
                   insetsFromSafeArea: Bool = false,
                   priority: UILayoutPriority = .required,
                   active: Bool = true,
                   identifier: String = #fileID,
                   line: Int = #line) -> Self {
        setCenterX(toView: view,
                   offset: offsetX,
                   insetsFromSafeArea: insetsFromSafeArea,
                   priority: priority,
                   active: active, 
                   identifier: identifier)
        .setCenterY(toView: view,
                    offset: offsetY,
                    insetsFromSafeArea: insetsFromSafeArea,
                    priority: priority,
                    active: active, 
                    identifier: identifier)
    }
    
    @discardableResult
    func setCenterX(toView view: UIView? = nil,
                    offset: CGFloat = 0,
                    insetsFromSafeArea: Bool = false,
                    priority: UILayoutPriority = .required,
                    active: Bool = true,
                    identifier: String = #fileID,
                    line: Int = #line) -> Self {
        set(attribute: .centerX,
            relation: .equal,
            toView: view ?? self.parent,
            toAttribute: .centerX,
            constant: offset,
            insetsFromSafeArea: insetsFromSafeArea,
            priority: priority,
            active: active, 
            identifier: identifier)
    }
    
    @discardableResult
    func setCenterY(toView view: UIView? = nil,
                    offset: CGFloat = 0,
                    insetsFromSafeArea: Bool = false,
                    priority: UILayoutPriority = .required,
                    active: Bool = true,
                    identifier: String = #fileID,
                    line: Int = #line) -> Self {
        set(attribute: .centerY,
            relation: .equal,
            toView: view ?? self.parent,
            toAttribute: .centerY,
            constant: offset,
            insetsFromSafeArea: insetsFromSafeArea,
            priority: priority,
            active: active, 
            identifier: identifier)
    }
}
