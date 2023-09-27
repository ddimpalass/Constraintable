//
//  ExampleCommands.swift
//  Autolayout
//
//  Created by Shchelochkov_D_S on 27.09.2023.
//

import Constraintable

protocol ExampleCommands: CaseIterable {
    var description: String { get }
    func action(view: Constraintable, isActive: Bool)
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
    case setLeading = "Set leading"
    case setTrailing = "Set trailing"
    case setTop = "Set top"
    case setBottom = "Set bottom"

    var description: String {
        rawValue
    }
    
    func action(view: Constraintable, isActive: Bool) {
        switch self {
        case .setLeading:
            view.setLeading(active: isActive)
        case .setTrailing:
            view.setTrailing(active: isActive)
        case .setTop:
            view.setTop(active: isActive)
        case .setBottom:
            view.setBottom(active: isActive)
        }
    }
}

enum CenterCommands: String, CaseIterable, ExampleCommands {
    case setCenter = "Set center"
    case setCenterX = "Set center x"
    case setCenterY = "Set center y"
    
    var description: String {
        rawValue
    }
    
    func action(view: Constraintable, isActive: Bool) {
        switch self {
        case .setCenter:
            view.setCenter(active: isActive)
        case .setCenterX:
            view.setCenterX(active: isActive)
        case .setCenterY:
            view.setCenterY(active: isActive)
        }
    }
}

enum FillCommands: String, CaseIterable, ExampleCommands {
    case fill = "Fill"
    case fillWidth = "Fill width"
    case fillHeight = "Fill height"
    
    var description: String {
        rawValue
    }
    
    func action(view: Constraintable, isActive: Bool) {
        switch self {
        case .fill:
            view.fill(active: isActive)
        case .fillWidth:
            view.fillWidth(active: isActive)
        case .fillHeight:
            view.fillHeight(active: isActive)
        }
    }
}

enum SizeCommands: String, CaseIterable, ExampleCommands {
    case setSize = "Set size"
    case setWidth = "Set width"
    case setHeight = "Set height"
    
    var description: String {
        rawValue
    }
    
    func action(view: Constraintable, isActive: Bool) {
        switch self {
        case .setSize:
            view.setSize(width: 50, height: 50, active: isActive)
        case .setWidth:
            view.setWidth(constant: 150, active: isActive)
        case .setHeight:
            view.setHeight(constant: 150, active: isActive)
        }
    }
}

enum RemoveCommands: String, CaseIterable, ExampleCommands {
    case removeAllConstraints = "Remove all constraints"
    
    var description: String {
        rawValue
    }
    
    func action(view: Constraintable, isActive: Bool) {
        switch self {
        case .removeAllConstraints:
            view.removeAllConstraints()
        }
    }
}
