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
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .green
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        view.addSubview(greenView)
        greenView
            .setTop(margin: 30)
            .setLeading(margin: 10)
            .setTrailing(margin: 40)
            .setBottom(margin: 50)
    }
}

