//
//  ExampleCommands.swift
//  Autolayout
//
//  Created by Shchelochkov_D_S on 27.09.2023.
//

import Constraintable
import UIKit

protocol ExampleCommands: CaseIterable {
    var description: String { get }
    func action(view: UIView, isActive: Bool)
}

enum ConstraintableExampleType: String, CaseIterable {
    case basic = "Basic"
    case center = "Center"
    case fill = "Fill"
    case size = "Size"
    case remove = "Remove"
    
    func getCommands() -> [any ExampleCommands] {
        switch self {
        case .basic:
            return BasicCommands.allCases
        case .center:
            return CenterCommands.allCases
        case .fill:
            return FillCommands.allCases
        case .size:
            return SizeCommands.allCases
        case .remove:
            return RemoveCommands.allCases
        }
    }
}

enum BasicCommands: String, CaseIterable, ExampleCommands {
    case setLeading = ".setLeading()"
    case setTrailing = ".setTrailing()"
    case setTop = ".setTop()"
    case setBottom = ".setBottom()"

    var description: String {
        rawValue
    }
    
    func action(view: UIView, isActive: Bool) {
        switch self {
        case .setLeading:
            view.autoLayout.setLeading(active: isActive)
        case .setTrailing:
            view.autoLayout.setTrailing(active: isActive)
        case .setTop:
            view.autoLayout.setTop(active: isActive)
        case .setBottom:
            view.autoLayout.setBottom(active: isActive)
        }
    }
}

enum CenterCommands: String, CaseIterable, ExampleCommands {
    case setCenter = ".setCenter()"
    case setCenterX = ".setCenterX()"
    case setCenterY = ".setCenterY()"
    
    var description: String {
        rawValue
    }
    
    func action(view: UIView, isActive: Bool) {
        switch self {
        case .setCenter:
            view.autoLayout.setCenter(active: isActive)
        case .setCenterX:
            view.autoLayout.setCenterX(active: isActive)
        case .setCenterY:
            view.autoLayout.setCenterY(active: isActive)
        }
    }
}

enum FillCommands: String, CaseIterable, ExampleCommands {
    case fill = ".fill()"
    case fillWidth = ".fillWidth()"
    case fillHeight = ".fillHeight()"
    
    var description: String {
        rawValue
    }
    
    func action(view: UIView, isActive: Bool) {
        switch self {
        case .fill:
            view.autoLayout.fill(active: isActive)
        case .fillWidth:
            view.autoLayout.fillWidth(active: isActive)
        case .fillHeight:
            view.autoLayout.fillHeight(active: isActive)
        }
    }
}

enum SizeCommands: String, CaseIterable, ExampleCommands {
    case setSize = ".setSize(width: 50, height: 50)"
    case setWidth = ".setWidth(constant: 150)"
    case setHeight = ".setHeight(constant: 100)"
    
    var description: String {
        rawValue
    }
    
    func action(view: UIView, isActive: Bool) {
        switch self {
        case .setSize:
            view.autoLayout.setSize(width: 50, height: 50, active: isActive)
        case .setWidth:
            view.autoLayout.setWidth(constant: 150, active: isActive)
        case .setHeight:
            view.autoLayout.setHeight(constant: 100, active: isActive)
        }
    }
}

enum RemoveCommands: String, CaseIterable, ExampleCommands {
    case removeAllConstraints = ".removeAllConstraints()"
    
    var description: String {
        rawValue
    }
    
    func action(view: UIView, isActive: Bool) {
        switch self {
        case .removeAllConstraints:
            view.autoLayout.removeAllConstraints()
        }
    }
}
