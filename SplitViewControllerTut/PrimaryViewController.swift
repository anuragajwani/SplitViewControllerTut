//
//  PrimaryViewController.swift
//  SplitViewControllerTut
//
//  Created by Anurag Ajwani on 09/01/2022.
//

import UIKit

protocol PrimaryViewControllerDelegate: AnyObject {
    func didSelectEmail(_ email: Email)
}

class PrimaryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var delegate: PrimaryViewControllerDelegate?
    
    private var emails: [Email] = []
    
    private let tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return view
    }()
    
    override func loadView() {
        self.view = UIView()
        self.view.backgroundColor = .white
        self.setupSubviews()
    }
    
    func show(emails: [Email]) {
        self.emails = emails
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let email = self.emails[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        var content = cell.defaultContentConfiguration()
        content.text = email.from
        content.secondaryText = email.subject
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.emails.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let email = self.emails[indexPath.row]
        self.delegate?.didSelectEmail(email)
    }
    
    private func setupSubviews() {
        self.setupTableView()
    }
    
    private func setupTableView() {
        self.view.addSubview(tableView)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        NSLayoutConstraint.activate([
            self.tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
    }
}
