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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        view.addSubview(greenView)
        greenView
            .fillWidth(margin: 20)
            .setHeight(constant: 50)
            .setTop(insetsFromSafeArea: true)
    }
}

