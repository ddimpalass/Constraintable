//
//  UIViewExtension.swift
//  Autolayout
//
//  Created by Shchelochkov_D_S on 20.09.2023.
//

import CommonCrypto
import CryptoKit
import UIKit

public enum ConstraintableAttribute: Int {
    case none
    case left
    case right
    case top
    case bottom
    case leading
    case trailing
    case width
    case height
    case centerX
    case centerY
    case lastBaseline
}

public protocol Constraintable: UIView {
    var parent: Constraintable? { get }
}

public extension Constraintable {
    @discardableResult
    func set(attribute: ConstraintableAttribute,
             relation: NSLayoutConstraint.Relation,
             toView view: UIView?,
             toAttribute: ConstraintableAttribute,
             multiplier: CGFloat = 1,
             constant: CGFloat,
             insetsFromSafeArea: Bool,
             priority: UILayoutPriority,
             active isActive: Bool,
             identifier: String = "") -> Self {
        let identifier = createConstraintIdentifier(identifier,
                                                    attribute: attribute,
                                                    relation: relation,
                                                    toView: view,
                                                    toAttribute: toAttribute,
                                                    multiplier: multiplier)
        if let constraint = constraints.first(where: { $0.identifier == identifier }) {
            updateConstraint(constraint,
                             constant: constant,
                             priority: priority,
                             active: isActive)
        } else if let constraint = view?.constraints.first(where: { $0.identifier == identifier }) {
            updateConstraint(constraint,
                             constant: constant,
                             priority: priority,
                             active: isActive)
        } else {
            setConstraint(attribute: attribute,
                          relation: relation,
                          toView: view,
                          toAttribute: toAttribute,
                          multiplier: multiplier,
                          constant: constant,
                          insetsFromSafeArea: insetsFromSafeArea,
                          priority: priority,
                          active: isActive,
                          identifier: identifier)
        }
        return self
    }
}

private extension Constraintable {
    @discardableResult
    private func setConstraint(attribute: ConstraintableAttribute,
                               relation: NSLayoutConstraint.Relation,
                               toView view: UIView?,
                               toAttribute: ConstraintableAttribute,
                               multiplier: CGFloat,
                               constant: CGFloat,
                               insetsFromSafeArea: Bool,
                               priority: UILayoutPriority,
                               active isActive: Bool,
                               identifier: String) -> Self {
        self.translatesAutoresizingMaskIntoConstraints = false
        let constraint = NSLayoutConstraint(item: self,
                                            attribute: NSLayoutConstraint.Attribute(rawValue: attribute.rawValue) ?? .notAnAttribute,
                                            relatedBy: relation,
                                            toItem: insetsFromSafeArea ? view?.safeAreaLayoutGuide : view,
                                            attribute: NSLayoutConstraint.Attribute(rawValue: toAttribute.rawValue) ?? .notAnAttribute,
                                            multiplier: multiplier,
                                            constant: constant)
        constraint.identifier = identifier
        constraint.priority = priority
        constraint.isActive = isActive
        return self
    }
    
    @discardableResult
    private func updateConstraint(_ constraint: NSLayoutConstraint,
                                  constant: CGFloat,
                                  priority: UILayoutPriority,
                                  active isActive: Bool) -> Self {
        constraint.constant = constant
        constraint.priority = priority
        constraint.isActive = isActive
        return self
    }
    
    private func createConstraintIdentifier(_ identifier: String,
                                            attribute: ConstraintableAttribute,
                                            relation: NSLayoutConstraint.Relation,
                                            toView view: UIView?,
                                            toAttribute: ConstraintableAttribute,
                                            multiplier: CGFloat) -> String {
        var address = ""
        if let view {
            address = "\(Unmanaged.passUnretained(self).toOpaque())\(Unmanaged.passUnretained(view).toOpaque())"
        }
        let hashId = SHA256.hash(data: Data("\(attribute.rawValue).\(relation.rawValue).\(address).\(toAttribute.rawValue).\(multiplier)".utf8))
        return "identifier: \(identifier), hashValue: \(hashId.hashValue)"
    }
}
