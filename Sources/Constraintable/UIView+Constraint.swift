//
//  UIView+Constraint.swift
//  Autolayout
//
//  Created by Shchelochkov_D_S on 20.09.2023.
//

import UIKit

public extension UIView {
    var autoLayout: Constraintable { Constraintable(constraintableView: self) }
}
