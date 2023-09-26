//
//  Constraintable+Fill.swift
//  Autolayout
//
//  Created by Shchelochkov_D_S on 25.09.2023.
//

import UIKit

public extension Constraintable {
    @discardableResult
    func fill(toView view: Constraintable? = nil, 
              insetsFromSafeArea: Bool = false,
              active: Bool = true) -> Self {
        fillWidth(toView: view, 
                  insetsFromSafeArea: insetsFromSafeArea,
                  active: active)
            .fillHeight(toView: view, 
                        insetsFromSafeArea: insetsFromSafeArea,
                        active: active)
    }
    
    @discardableResult
    func fillWidth(toView view: Constraintable? = nil, 
                   offset: CGFloat = 0,
                   insetsFromSafeArea: Bool = false,
                   active: Bool = true) -> Self {
        setLeading(toView: view, 
                   offset: offset,
                   insetsFromSafeArea: insetsFromSafeArea,
                   active: active)
            .setTrailing(toView: view, 
                         offset: offset,
                         insetsFromSafeArea: insetsFromSafeArea,
                         active: active)
    }
    
    @discardableResult
    func fillHeight(toView view: Constraintable? = nil, 
                    offset: CGFloat = 0,
                    insetsFromSafeArea: Bool = false,
                    active: Bool = true) -> Self {
        setTop(toView: view, 
               offset: offset,
               insetsFromSafeArea: insetsFromSafeArea,
               active: active)
            .setBottom(toView: view, 
                       offset: offset,
                       insetsFromSafeArea: insetsFromSafeArea,
                       active: active)
    }
}
