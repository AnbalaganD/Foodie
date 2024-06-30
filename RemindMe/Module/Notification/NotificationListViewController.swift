//
//  NotificationListViewController.swift
//  RemindMe
//
//  Created by Anbalagan on 30/06/24.
//

import UIKit

final class NotificationListViewController: UIViewController {
    private var notificationTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        registerCells()
        setupSource()
    }
    
    private func registerCells() {
        notificationTableView.register(
            NotificationCell.self,
            forCellReuseIdentifier: NotificationCell.cellIdentifier
        )
    }
    
    private func setupSource() {
        notificationTableView.delegate = self
        notificationTableView.dataSource = self
    }
}

private extension NotificationListViewController {
    func setupView() {
        title = "Notification"
        view.backgroundColor = .white
        
        notificationTableView = UITableView(frame: .zero)
        notificationTableView.translatesAutoresizingMaskIntoConstraints = false
        notificationTableView.separatorStyle = .none
        notificationTableView.backgroundColor = .clear
        view.addSubview(notificationTableView)
        
        notificationTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        notificationTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        notificationTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        notificationTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

extension NotificationListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: NotificationCell.cellIdentifier,
            for: indexPath
        ) as! NotificationCell
        
        cell.setupData()
        return cell
    }
}
