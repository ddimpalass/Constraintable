//
//  ViewController.swift
//  Autolayout
//
//  Created by Shchelochkov_D_S on 08.09.2023.
//

import Constraintable
import UIKit

final class ViewController: UIViewController {
    let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .cyan
        return view
    }()
    
    let exampleView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()

    let tableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = .green
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(contentView)
        view.addSubview(exampleView)
        view.addSubview(tableView)
        contentView
            .setTop(insetsFromSafeArea: true)
            .fillWidth(insetsFromSafeArea: true)
            .setHeight(equalTo: tableView)
        exampleView
            .fillWidth(offset: 20)
            .setHeight(constant: 50)
            .setTop(insetsFromSafeArea: true)
        tableView
            .setTop(toView: contentView, attribute: .bottom)
            .fillWidth(insetsFromSafeArea: true)
            .setBottom(insetsFromSafeArea: true)
    }
}

