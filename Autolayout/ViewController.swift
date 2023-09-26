//
//  ViewController.swift
//  Autolayout
//
//  Created by Shchelochkov_D_S on 08.09.2023.
//

import UIKit

final class ViewController: UIViewController {
    let greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    let yellowView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()

    lazy var button: UIButton = {
        let button = UIButton(type: .close)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        view.addSubview(greenView)
        view.addSubview(yellowView)
        view.addSubview(button)
        greenView
            .fillWidth(offset: 20)
            .setHeight(constant: 50)
            .setTop(insetsFromSafeArea: true)
        yellowView
            .fillWidth(offset: 20)
            .setHeight(constant: 50)
            .setTop(toView: greenView, constraint: .bottom, offset: 20)
        button
            .setSize(width: 50, height: 50)
            .setCenter()
    }
    
    @objc
    func buttonTapped(sender: UIButton) {
        greenView
            .setHeight(constant: 100)
    }
}

