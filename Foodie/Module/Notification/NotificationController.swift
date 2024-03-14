//
//  NotificationController.swift
//  Foodie
//
//  Created by Anbalagan D on 25/08/21.
//

import UIKit

class NotificationController: UIViewController {
    
    @IBOutlet weak var generateNotificationButton: UIButton!
    // Localized String in Notification
    //class func localizedUserNotificationString(forKey key: String, arguments: [Any]?) -> String

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        generateNotificationButton.layer.borderWidth = 1.0
        generateNotificationButton.layer.borderColor = UIColor.red.cgColor
        
        registerNotificationCategory()
        UNUserNotificationCenter.current().delegate = self
        
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
        
        var authorizationOption: UNAuthorizationOptions = [.alert, .sound, .badge] //, .carPlay]
        
        if #available(iOS 12.0, *) {
//            authorizationOption.insert(.provisional)
//            authorizationOption.insert(.criticalAlert)
            authorizationOption.insert(.providesAppNotificationSettings)
        }
        
        if #available(iOS 13.0, *) {
            authorizationOption.insert(.announcement)
        }
        
        UNUserNotificationCenter.current().requestAuthorization(options: authorizationOption) { isAuthorized, error in
            print(isAuthorized)
            print(error ?? "")
            
            if isAuthorized {
//                DispatchQueue.main.async {
//                    UIApplication.shared.registerForRemoteNotifications()
//                }
                return
            }
            
//            DispatchQueue.main.async {
//                UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!, options: [:], completionHandler: nil)
//            }
        }
    }
    
    @IBAction private func generateNotificationTapped() {
//        UNUserNotificationCenter.current().getNotificationSettings { notificationSettings in
//            print(notificationSettings)
//        }
        
        generateNotificationButton.layer.borderWidth = 1.0
        generateNotificationButton.layer.borderColor = UIColor.green.cgColor
        
        scheduleNotification()
    }
    
    private func scheduleNotification() {
        //Create Notification Content
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

        if #available(iOS 12.0, *) {
            let isFavorite = Bool.random()
            notificationContent.threadIdentifier = isFavorite ? "Favorite food" : "Recently order"
            notificationContent.summaryArgument = isFavorite ? "Favorite" : "Recent"
            notificationContent.summaryArgumentCount = 56
        }
        
        let foodUrl = Bundle.main.url(forResource: "food", withExtension: "jpeg")
        let salt_lemon = Bundle.main.url(forResource: "salt_lemon", withExtension: "jpeg")
        
        let url = Bool.random() ? foodUrl : salt_lemon
        if let attachment = try? UNNotificationAttachment(
            identifier: UUID().uuidString,
            url: url!,
            options: nil
        ) {
            notificationContent.attachments = [attachment]
        }
        
        //Create Trigger
        let timeIntervalTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        //Create Notification request
        let notificationRequest = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: notificationContent,
            trigger: timeIntervalTrigger
        )
        
        //Schedule notification with the system
        UNUserNotificationCenter.current().add(notificationRequest) { error in
            print(error ?? "")
        }
    }
    
    private func registerNotificationCategory() {
        
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
        
        if #available(iOS 11.0, *) {
            let notificationCategory = UNNotificationCategory(
                identifier: "user_action_category",
                actions: [commentAction, likeAction, dislikeAction],
                intentIdentifiers: [],
                options: [.hiddenPreviewsShowSubtitle, .hiddenPreviewsShowTitle]
            )
            
//            UNUserNotificationCenter.current().setNotificationCategories([notificationCategory])
            
            let testNotificationCategory = UNNotificationCategory(
                identifier: "test_action_category",
                actions: [commentAction, likeAction, dislikeAction],
                intentIdentifiers: ["Hai", "Hello"],
                options: [.hiddenPreviewsShowSubtitle, .hiddenPreviewsShowTitle]
            )
            
            UNUserNotificationCenter.current().setNotificationCategories([notificationCategory, testNotificationCategory])
            
        } else {
            let notificationCategory = UNNotificationCategory(
                identifier: "user_action_category",
                actions: [commentAction, likeAction, dislikeAction],
                intentIdentifiers: [],
                options: .customDismissAction
            )
            
            UNUserNotificationCenter.current().setNotificationCategories([notificationCategory])
        }
    }
}

extension NotificationController: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .sound])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        completionHandler()
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, openSettingsFor notification: UNNotification?) {
        print(#function)
    }
}
