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
              offset: UIEdgeInsets = .zero,
              insetsFromSafeArea: Bool = false,
              active: Bool = true) -> Self {
        fillWidth(toView: view,
                  leadingOffset: offset.left,
                  trailingOffset: offset.right,
                  insetsFromSafeArea: insetsFromSafeArea,
                  active: active)
        .fillHeight(toView: view,
                    topOffset: offset.top,
                    bottomOffset: offset.bottom,
                    insetsFromSafeArea: insetsFromSafeArea,
                    active: active)
    }
    
    @discardableResult
    func fillWidth(toView view: Constraintable? = nil,
                   leadingOffset: CGFloat = 0,
                   trailingOffset: CGFloat = 0,
                   insetsFromSafeArea: Bool = false,
                   active: Bool = true) -> Self {
        setLeading(toView: view,
                   offset: leadingOffset,
                   insetsFromSafeArea: insetsFromSafeArea,
                   active: active)
        .setTrailing(toView: view,
                     offset: trailingOffset,
                     insetsFromSafeArea: insetsFromSafeArea,
                     active: active)
    }
    
    @discardableResult
    func fillWidth(toView view: Constraintable? = nil,
                   offset: CGFloat = 0,
                   insetsFromSafeArea: Bool = false,
                   active: Bool = true) -> Self {
        fillWidth(toView: view,
                  leadingOffset: offset,
                  trailingOffset: offset,
                  insetsFromSafeArea: insetsFromSafeArea,
                  active: active)
    }
    
    @discardableResult
    func fillHeight(toView view: Constraintable? = nil,
                    topOffset: CGFloat = 0,
                    bottomOffset: CGFloat = 0,
                    insetsFromSafeArea: Bool = false,
                    active: Bool = true) -> Self {
        setTop(toView: view,
               offset: topOffset,
               insetsFromSafeArea: insetsFromSafeArea,
               active: active)
        .setBottom(toView: view,
                   offset: bottomOffset,
                   insetsFromSafeArea: insetsFromSafeArea,
                   active: active)
    }
    
    @discardableResult
    func fillHeight(toView view: Constraintable? = nil,
                    offset: CGFloat = 0,
                    insetsFromSafeArea: Bool = false,
                    active: Bool = true) -> Self {
        fillHeight(toView: view,
                   topOffset: offset,
                   bottomOffset: offset,
                   insetsFromSafeArea: insetsFromSafeArea,
                   active: active)
    }
}
