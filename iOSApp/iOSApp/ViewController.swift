//
//  ViewController.swift
//  iOSApp
//
//  Created by Amit Jangirh on 14/06/21.
//

import UIKit

class ViewController: UITableViewController {
    // MARK: - Statics
    struct Constant {
        static let cellIdentifier: String = "TableView_Cell"
        static let sectionHeight: CGFloat = 40
        static let rowHeight: CGFloat = 40
    }
    
    // MARK: - Var
    var viewModel = ViewModel(sectionArray: sections)
        
    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        tableView.tableFooterView = UIView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constant.cellIdentifier)
    }
}

// MARK: - UITableViewDataSource
extension ViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.sectionCount()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.rowCount(at: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.cellIdentifier, for: indexPath)
        cell.textLabel?.text = viewModel[valueAt: indexPath]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constant.rowHeight
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel[section: section].title
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Constant.sectionHeight
    }
}
