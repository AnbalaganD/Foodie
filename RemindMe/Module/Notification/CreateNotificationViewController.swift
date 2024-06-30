//
//  CreateNotificationViewController.swift
//  RemindMe
//
//  Created by Anbalagan on 01/07/24.
//

import UIKit

final class CreateNotificationViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupView()
    }
    
    @objc private func cancel() {
        dismiss(animated: true)
    }
    
    @objc private func createNotification() {
        dismiss(animated: true)
    }
}

private extension CreateNotificationViewController {
    func setupView() {
        view.backgroundColor = .white
    }
    
    func setupNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "Cancel",
            style: .plain,
            target: self,
            action: #selector(cancel)
        )
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Done",
            style: .done,
            target: self,
            action: #selector(createNotification)
        )
    }
}
