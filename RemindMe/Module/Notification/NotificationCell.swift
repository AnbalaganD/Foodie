//
//  NotificationCell.swift
//  RemindMe
//
//  Created by Anbalagan on 30/06/24.
//

import UIKit

final class NotificationCell: UITableViewCell {
    static let cellIdentifier = "NotificationCell"
    
    private var containerView: UIView!
    private var notificationTitleLabel: UILabel!
    private var notificationSubtitleLabel: UILabel!
    private var notificationBodyLabel: UILabel!
    private var notificationStatusLabel: UILabel!
    private var notificationStatusImageView: UIImageView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension NotificationCell {
    func setupView() {
        contentView.backgroundColor = .white
        
        containerView = UIView(frame: .zero)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 5
        containerView.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        containerView.layer.shadowRadius = 2
        containerView.layer.shadowOpacity = 0.9
        containerView.layer.shadowOffset = .init(width: 0, height: 1)
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = UIColor.black.withAlphaComponent(0.1).cgColor
        contentView.addSubview(containerView)
        
        notificationTitleLabel = UILabel(frame: .zero)
        notificationTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        notificationTitleLabel.font = .systemFont(ofSize: 14, weight: .medium)
        notificationTitleLabel.textColor = .notificationTitle
        notificationTitleLabel.numberOfLines = 2
        containerView.addSubview(notificationTitleLabel)
        
        notificationSubtitleLabel = UILabel(frame: .zero)
        notificationSubtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        notificationSubtitleLabel.font = .systemFont(ofSize: 12)
        notificationSubtitleLabel.textColor = .notificationSubtitle
        containerView.addSubview(notificationSubtitleLabel)
        
        notificationBodyLabel = UILabel(frame: .zero)
        notificationBodyLabel.translatesAutoresizingMaskIntoConstraints = false
        notificationBodyLabel.font = .systemFont(ofSize: 13)
        notificationBodyLabel.textColor = .notificationBody
        notificationBodyLabel.numberOfLines = 2
        containerView.addSubview(notificationBodyLabel)
        
        notificationStatusImageView = UIImageView(frame: .zero)
        notificationStatusImageView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(notificationStatusImageView)
        
        notificationStatusLabel = UILabel(frame: .zero)
        notificationStatusLabel.translatesAutoresizingMaskIntoConstraints = false
        notificationStatusLabel.font = .systemFont(ofSize: 13)
        notificationStatusLabel.textColor = .scheduleStatus
        containerView.addSubview(notificationStatusLabel)
        
        containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4).isActive = true
        containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4).isActive = true
        
        notificationTitleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8).isActive = true
        notificationTitleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8).isActive = true
        notificationTitleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8).isActive = true
        
        notificationSubtitleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8).isActive = true
        notificationSubtitleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8).isActive = true
        notificationSubtitleLabel.topAnchor.constraint(equalTo: notificationTitleLabel.bottomAnchor, constant: 3).isActive = true
        
        notificationBodyLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8).isActive = true
        notificationBodyLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8).isActive = true
        notificationBodyLabel.topAnchor.constraint(equalTo: notificationSubtitleLabel.bottomAnchor, constant: 6).isActive = true
        
        notificationStatusImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8).isActive = true
        notificationStatusImageView.widthAnchor.constraint(equalToConstant: 16).isActive = true
        notificationStatusImageView.heightAnchor.constraint(equalToConstant: 16).isActive = true
        notificationStatusImageView.topAnchor.constraint(equalTo: notificationBodyLabel.bottomAnchor, constant: 4).isActive = true
        
        notificationStatusLabel.leadingAnchor.constraint(equalTo: notificationStatusImageView.trailingAnchor, constant: 4).isActive = true
        notificationStatusLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8).isActive = true
        notificationStatusLabel.centerYAnchor.constraint(equalTo: notificationStatusImageView.centerYAnchor).isActive = true
        notificationStatusLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8).isActive = true
    }
}

extension NotificationCell {
    func setupData() {
        notificationTitleLabel.text = "Exclusive offer for you: 20% off new arrivals!  |  Overview:** Shop now before it's gone!"
        notificationSubtitleLabel.text = "Limited time offers"
        notificationBodyLabel.text = "Shop our newest collection of groceries at unbeatable discounts! Stock is limited, so don’t wait! This offer ends in"
        notificationStatusImageView.image = .schedule
        notificationStatusLabel.text = "Scheduled tomorrow at 11:00 PM"
    }
}
