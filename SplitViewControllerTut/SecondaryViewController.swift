//
//  SecondaryViewController.swift
//  SplitViewControllerTut
//
//  Created by Anurag Ajwani on 09/01/2022.
//

import UIKit

class SecondaryViewController: UIViewController {
    
    private let label: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Secondary"
        return view
    }()
    
    override func loadView() {
        self.view = UIView()
        self.view.backgroundColor = .white
        self.setupSubviews()
    }
    
    private func setupSubviews() {
        self.setupLabel()
    }
    
    private func setupLabel() {
        self.view.addSubview(label)
        NSLayoutConstraint.activate([
            self.label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        ])
    }
}
