//
//  UIView+Constraint.swift
//  Autolayout
//
//  Created by Shchelochkov_D_S on 20.09.2023.
//

import UIKit

extension UIView: Constraintable {
    public var parent: Constraintable? { superview }
}
