//
//  NotificationCell.swift
//  RemindMe
//
//  Created by Anbalagan on 30/06/24.
//

import UIKit

final class NotificationCell: UITableViewCell {
    static let cellIdentifier = "NotificationCell"

    private var notificationTitleLabel: UILabel!
    private var notificationSubtitleLabel: UILabel!
    private var notificationBodyLabel: UILabel!
    private var notificationStatusLabel: UILabel!
    private var notificationStatusImageView: UIImageView!
    private var cancelButton: DashLineView!
    private var rescheduleButton: DashLineView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func cancelNotification() {
        print(#function)
    }
    
    @objc private func rescheduleNotification() {
        print(#function)
    }
}

private extension NotificationCell {
    func setupView() {
        contentView.backgroundColor = .white
        
        let containerView = UIView(frame: .zero)
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
        notificationTitleLabel.setContentHuggingPriority(.init(249), for: .vertical)
        notificationTitleLabel.setContentCompressionResistancePriority(.init(249), for: .vertical)
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
        
        cancelButton = DashLineView(frame: .zero)
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.cornerRadius = 3
        cancelButton.lineWidth = 1
        cancelButton.lineColor = .cancelNotification
        cancelButton.dashPattern = [6, 4]
        cancelButton.addTarget(self, action: #selector(cancelNotification), for: .touchUpInside)
        containerView.addSubview(cancelButton)
        
        let cancelLabel = UILabel(frame: .zero)
        cancelLabel.translatesAutoresizingMaskIntoConstraints = false
        cancelLabel.text = "Cancel"
        cancelLabel.textColor = .cancelNotification
        cancelLabel.font = .systemFont(ofSize: 13)
        cancelLabel.textAlignment = .center
        cancelButton.addSubview(cancelLabel)
        
        rescheduleButton = DashLineView(frame: .zero)
        rescheduleButton.translatesAutoresizingMaskIntoConstraints = false
        rescheduleButton.cornerRadius = 3
        rescheduleButton.lineWidth = 1
        rescheduleButton.lineColor = .rescheduleNotification
        rescheduleButton.dashPattern = [6, 4]
        rescheduleButton.addTarget(self, action: #selector(rescheduleNotification), for: .touchUpInside)
        containerView.addSubview(rescheduleButton)
        
        let rescheduleLabel = UILabel(frame: .zero)
        rescheduleLabel.translatesAutoresizingMaskIntoConstraints = false
        rescheduleLabel.text = "Reschedule"
        rescheduleLabel.textColor = .rescheduleNotification
        rescheduleLabel.font = .systemFont(ofSize: 13)
        rescheduleButton.addSubview(rescheduleLabel)
        
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
        
        rescheduleLabel.leadingAnchor.constraint(equalTo: rescheduleButton.leadingAnchor, constant: 12).isActive = true
        rescheduleLabel.trailingAnchor.constraint(equalTo: rescheduleButton.trailingAnchor, constant: -12).isActive = true
        rescheduleLabel.topAnchor.constraint(equalTo: rescheduleButton.topAnchor, constant: 6).isActive = true
        rescheduleLabel.bottomAnchor.constraint(equalTo: rescheduleButton.bottomAnchor, constant: -6).isActive = true
        
        rescheduleButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8).isActive = true
        rescheduleButton.topAnchor.constraint(equalTo: notificationStatusLabel.bottomAnchor, constant: 10).isActive = true
        rescheduleButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8).isActive = true
        
        cancelLabel.leadingAnchor.constraint(equalTo: cancelButton.leadingAnchor, constant: 12).isActive = true
        cancelLabel.trailingAnchor.constraint(equalTo: cancelButton.trailingAnchor, constant: -12).isActive = true
        cancelLabel.topAnchor.constraint(equalTo: cancelButton.topAnchor, constant: 6).isActive = true
        cancelLabel.bottomAnchor.constraint(equalTo: cancelButton.bottomAnchor, constant: -6).isActive = true
        
        cancelButton.trailingAnchor.constraint(equalTo: rescheduleButton.leadingAnchor, constant: -8).isActive = true
        cancelButton.centerYAnchor.constraint(equalTo: rescheduleButton.centerYAnchor).isActive = true
        cancelButton.widthAnchor.constraint(equalTo: rescheduleButton.widthAnchor).isActive = true
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
