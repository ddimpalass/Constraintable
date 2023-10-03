//
//  Constraintable.swift
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

public struct Constraintable {
    unowned let constraintableView: UIView
    weak var parent: UIView? { constraintableView.superview }
}

extension Constraintable {
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
             identifier: String = #fileID,
             line: Int = #line) -> Self {
        let identifier = createConstraintIdentifier(identifier,
                                                    line: line,
                                                    attribute: attribute,
                                                    relation: relation,
                                                    toView: view,
                                                    toAttribute: toAttribute,
                                                    multiplier: multiplier)
        if let constraint = constraintableView.constraints.first(where: { isEqual($0.identifier, identifier) }) {
            updateConstraint(constraint,
                             constant: constant,
                             priority: priority,
                             active: isActive)
        } else if let constraint = view?.constraints.first(where: { isEqual($0.identifier, identifier) }) {
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
        constraintableView.translatesAutoresizingMaskIntoConstraints = false
        let constraint = NSLayoutConstraint(item: constraintableView,
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
                                            line: Int,
                                            attribute: ConstraintableAttribute,
                                            relation: NSLayoutConstraint.Relation,
                                            toView view: UIView?,
                                            toAttribute: ConstraintableAttribute,
                                            multiplier: CGFloat) -> String {
        var address = "\(Unmanaged.passUnretained(constraintableView).toOpaque())"
        if let view {
            address += ".\(Unmanaged.passUnretained(view).toOpaque())"
        }
        let hash = SHA256.hash(data: Data("\(attribute.rawValue).\(relation.rawValue).\(address).\(toAttribute.rawValue).\(multiplier)".utf8))
        return "identifier: \(identifier), line: \(line), hashValue: \(hash.hashValue)"
    }
    
    private func isEqual(_ lhs: String?, _ rhs: String?) -> Bool {
        guard let lhs = lhs?.components(separatedBy: "hashValue:").last,
              let rhs = rhs?.components(separatedBy: "hashValue:").last
        else { return false }
        return lhs == rhs
    }
}
