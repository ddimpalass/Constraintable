//
//  ViewController.swift
//  Autolayout
//
//  Created by Shchelochkov_D_S on 08.09.2023.
//

import Constraintable
import UIKit

final class ViewController: UIViewController {
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .cyan.withAlphaComponent(0.2)
        return view
    }()
    
    private let exampleView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemRed
        return view
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.backgroundColor = .systemGroupedBackground
        tableView.dataSource = self
        tableView.delegate = self
        tableView.allowsMultipleSelection = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        return tableView
    }()
    
    private let cellIdentifier = "cellIdentifier"

    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        view.backgroundColor = .white
        view.addSubview(contentView)
        contentView.addSubview(exampleView)
        view.addSubview(tableView)
        contentView
            .setTop()
            .fillWidth()
            .setHeight(equalTo: tableView)
        tableView
            .setTop(toView: contentView, attribute: .bottom)
            .fillWidth()
            .setBottom()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        ConstraintableExampleType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        ConstraintableExampleType.allCases[section].rawValue
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ConstraintableExampleType.allCases[section].getCommands().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier") else {
            fatalError("You forgot to register your table view cell")
        }
        var content = cell.defaultContentConfiguration()
        content.text = ConstraintableExampleType.allCases[indexPath.section].getCommands()[indexPath.row].description
        content.textProperties.color = .black
        cell.contentConfiguration = content
        cell.backgroundColor = .white
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        ConstraintableExampleType.allCases[indexPath.section].getCommands()[indexPath.row].action(view: exampleView, isActive: true)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        ConstraintableExampleType.allCases[indexPath.section].getCommands()[indexPath.row].action(view: exampleView, isActive: false)
    }
}
