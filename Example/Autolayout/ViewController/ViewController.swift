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
    private var selectedIndexPaths: [IndexPath] = []

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
        cell.textLabel?.text = ConstraintableExampleType.allCases[indexPath.section].getCommands()[indexPath.row].description
        cell.backgroundColor = .white
        cell.accessoryType = selectedIndexPaths.contains(indexPath) ? .checkmark : .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let command = ConstraintableExampleType.allCases[indexPath.section].getCommands()[indexPath.row]
        guard command.self is RemoveCommands else {
            command.action(view: exampleView)
            selectedIndexPaths.append(indexPath)
            tableView.reloadData()
            return
        }
        exampleView.removeAllConstraints()
        selectedIndexPaths = []
        tableView.reloadData()
    }
}
