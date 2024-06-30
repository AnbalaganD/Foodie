//
//  NotificationController.swift
//  Foodie
//
//  Created by Anbalagan D on 25/08/21.
//

import UIKit
import UserNotifications

final class NotificationController: UIViewController {
    @IBOutlet weak var generateNotificationButton: UIButton!
    // Localized String in Notification
    // class func localizedUserNotificationString(forKey key: String, arguments: [Any]?) -> String
    
    private let notificationManager = NotificationManager.shared

    override func viewDidLoad() {
        super.viewDidLoad()

        generateNotificationButton.layer.borderWidth = 1.0
        generateNotificationButton.layer.borderColor = UIColor.red.cgColor

        setNotificationCategory()

//        UNUserNotificationCenter.current().removeDeliveredNotifications(withIdentifiers: ["test"])
//
//        UNUserNotificationCenter.current().getDeliveredNotifications { notifications in
//            for notification in notifications {
//                notification.request.identifier
//            }
//        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        notificationManager.requestAuthorization { result in
            DispatchQueue.main.async {
                if case Result.failure(let error) = result {
                    return print(error)
                }
                
                let permissionGranded = try! result.get()
                if permissionGranded {
                    UIApplication.shared.registerForRemoteNotifications()
                } else {
                    let url: URL?
                    if #available(iOS 16.0, *) {
                        url = URL(string: UIApplication.openNotificationSettingsURLString)
                    } else {
                        url = URL(string: UIApplication.openSettingsURLString)
                    }
                    if let url {
                        UIApplication.shared.open(url)
                    }
                }
            }
        }
    }

    @IBAction private func generateNotificationTapped() {
//        UNUserNotificationCenter.current().getNotificationSettings { notificationSettings in
//            print(notificationSettings)
//        }

        scheduleNotification()
    }

    private func scheduleNotification() {
        // Create Notification Content
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = "Test notification created by anbu"
        notificationContent.subtitle = "Fun with notification"
        notificationContent.body = "Keep learn by your mistake and don't repeat that again. :)"
        notificationContent.badge = 1
        notificationContent.sound = UNNotificationSound(named: UNNotificationSoundName("cucko.wav"))
        notificationContent.categoryIdentifier = "user_action_category"
        if #available(iOS 15.0, *) {
            notificationContent.interruptionLevel = .timeSensitive
        }

        let isFavorite = Bool.random()
        notificationContent.threadIdentifier = isFavorite ? "Favorite food" : "Recently order"

        let foodUrl = Bundle.main.url(forResource: "food", withExtension: "jpeg")
        let saltLemon = Bundle.main.url(forResource: "salt_lemon", withExtension: "jpeg")

        let url = Bool.random() ? foodUrl : saltLemon
        if let attachment = try? UNNotificationAttachment(
            identifier: UUID().uuidString,
            url: url!,
            options: nil
        ) {
            notificationContent.attachments = [attachment]
        }

        // Create Trigger
        let timeIntervalTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

        // Create Notification request
        let notificationRequest = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: notificationContent,
            trigger: timeIntervalTrigger
        )

        // Schedule notification with the system
        UNUserNotificationCenter.current().add(notificationRequest) { error in
            print(error ?? "")
        }
    }

    private func setNotificationCategory() {

        let commentAction = UNTextInputNotificationAction(
            identifier: "comment_action",
            title: "Comment",
            options: UNNotificationActionOptions(rawValue: 0),
            textInputButtonTitle: "Comment",
            textInputPlaceholder: "Enter your comment about this quote"
        )

        let likeAction = UNNotificationAction(
            identifier: "like_action",
            title: "Like",
            options: UNNotificationActionOptions(rawValue: 0)
        )

        let dislikeAction = UNNotificationAction(
            identifier: "dislike_action",
            title: "Dislike",
            options: UNNotificationActionOptions(rawValue: 0)
        )
        
        let notificationCategory = UNNotificationCategory(
            identifier: "user_action_category",
            actions: [commentAction, likeAction, dislikeAction],
            intentIdentifiers: [],
            options: [.hiddenPreviewsShowSubtitle, .hiddenPreviewsShowTitle]
        )
        
        // UNUserNotificationCenter.current().setNotificationCategories([notificationCategory])
        
        let testNotificationCategory = UNNotificationCategory(
            identifier: "test_action_category",
            actions: [commentAction, likeAction, dislikeAction],
            intentIdentifiers: ["Hai", "Hello"],
            options: [.hiddenPreviewsShowSubtitle, .hiddenPreviewsShowTitle]
        )
        
        UNUserNotificationCenter.current().setNotificationCategories([notificationCategory, testNotificationCategory])
    }
}
