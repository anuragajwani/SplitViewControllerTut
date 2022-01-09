//
//  EmailSplitViewController.swift
//  SplitViewControllerTut
//
//  Created by Anurag Ajwani on 09/01/2022.
//

import UIKit

class EmailSplitViewController: UISplitViewController, PrimaryViewControllerDelegate {
    
    private var emails: [Email] = [
        Email(from: "email1@host.com", subject: "email 1", contents: "Email 1 content"),
        Email(from: "email2@host.com", subject: "email 2", contents: "Email 2 content"),
        Email(from: "email3@host.com", subject: "email 3", contents: "Email 3 content"),
        Email(from: "email4@host.com", subject: "email 4", contents: "Email 4 content"),
    ]
    
    private var primaryViewController: PrimaryViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadViewControllers()
        self.primaryViewController.show(emails: self.emails)
    }
    
    func didSelectEmail(_ email: Email) {
        let vc = SecondaryViewController()
        vc.showEmail(email)
        self.showDetailViewController(vc, sender: nil)
    }
    
    private func loadViewControllers() {
        self.primaryViewController = PrimaryViewController()
        self.primaryViewController.delegate = self
        let navController = UINavigationController(rootViewController: self.primaryViewController)
        let detail = SecondaryViewController()
        detail.showEmail(emails.first!)
        self.viewControllers = [navController, detail]
    }
}
