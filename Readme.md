# UNUserNotification Framework Sample Project

## Overview

From iOS 10.0 apple provide UserNotifications framework to handling local and remote notification. 

## Feature

1. Permission
2. Grouping
3. Trigger
4. Attachment and Sound
5. Category and Action
6. Service extension
7. Content extension


### Permission

iOS 10.0 introduce new `UserNotification` framework to handle both remote and local notification. And support badge, sound, alert type authorization as well.

iOS 12.0 apple introduce new authorization option `provisional`, `providesAppNotificationSettings` and `criticalAlert`

`provisional`: The ability to post noninterrupting notifications provisionally to the Notification Center.<br>
`providesAppNotificationSettings`: An option indicating the system should display a button for in-app notification settings.<br>
`criticalAlert`: The ability to play sounds for critical alerts.


### Grouping

Set `threadIdentifier` in `UNMutableNotificationContent` system group the notification using this identifier.


### Trigger

iOS support four type of Trigger to schedule notification

1. UNCalendarNotificationTrigger
2. UNTimeIntervalNotificationTrigger
3. UNLocationNotificationTrigger
4. UNPushNotificationTrigger

Note: Except `UNPushNotificationTrigger` we can use all other trigger to schedule our notification.


### Attachment and Sound

From iOS 10.0 `UserNotification` framework support to customize notification sound and notification can show attachments.

__Limitation:__ 
* Its support multiple notification but show first attachment only in notification alert.
* Notification only support .aiff, .wav, or .caf sound file.


### Category and Action

`UserNotification` support notification category. We must register our category objects using the `setNotificationCategories(_:)` method of `UNUserNotificationCenter`. Each notification category have associated action. Based on category system will show the appropriate action


### Service extension

Service extension give the opportunity to modify notification content before delivery to user. We can use this opportunity to modify notification content.
Remote notification payload we must include `mutable-content: 1` within apns object otherwise service extension not work.


###  Content extension

We can customize notification appearance using `UNNotificationContentExtension`. We shoud adopt this protocol in the custom UIViewController subclass that we use to present our interface


### Conclusion

This framework definitely do lot than what we saw here. If you want to learn more should checkout official apple documentation.

[UserNotification](https://developer.apple.com/documentation/usernotifications)
