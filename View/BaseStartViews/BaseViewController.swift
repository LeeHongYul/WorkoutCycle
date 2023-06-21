//
//  BaseViewController.swift
//  WorkoutCycle
//
//  Created by 이홍렬 on 2023/06/13.
//

import UIKit
import UserNotifications

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }

    func checkPermission() {
        let notiCenter = UNUserNotificationCenter.current()

        notiCenter.getNotificationSettings { setting in
            switch setting.authorizationStatus {

            case .notDetermined:
                notiCenter.requestAuthorization(options: [.alert, .sound]) { permissionGranted, error in
                    if permissionGranted {
                        self.grantedNotification()
                    }
                }
            case .denied:
                return
            case .authorized:
                self.grantedNotification()
            @unknown default:
                return
            }
        }
    }

    func grantedNotification() {
        let notiCenter = UNUserNotificationCenter.current()

        notiCenter.getNotificationSettings { setting in
            let title = "오늘 운동"
            let message = "운동하셔야죠"
//            let hour = 13
//            let minute = 3
            let isDaily = true

            if (setting.authorizationStatus == .authorized) {
                let content = UNMutableNotificationContent()
                content.title = title
                content.body = message
                content.sound = .default

                let calendar = Calendar.current
                var dateComponents = DateComponents(calendar: calendar, timeZone: TimeZone.current)
//                dateComponents.hour = hour
//                dateComponents.minute = minute
                dateComponents.second = 10

                let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)

                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

                UNUserNotificationCenter.current().add(request) { error in
                    if let error {
                        print(error)
                    }
                }

            } else {

            }
        }
    }
    
    func showAlert(title : String,
                   message : String ,
                   confrimTitle: String = "확인" ,
                   cancelTitle : String = "취소",
                   callback: @escaping () -> Void,
                   cancelCallback : @escaping () -> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

        let alertAction = UIAlertAction(title: confrimTitle, style: .default) { _ in
           callback()
        }


        let cancleAction = UIAlertAction(title: cancelTitle, style: .destructive) { _ in
            cancelCallback()
         }


        alert.addAction(cancleAction)
        alert.addAction(alertAction)
        self.present(alert, animated: true )
    }

    func showActionSheet(title: String, message: String, callback: @escaping () -> Void,
                         cancelCallback : @escaping () -> Void) {
        let actionSheet = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)

        let confirmAction = UIAlertAction(title: "확인", style: .default){ _ in
            callback()
        }
        let cancleAction = UIAlertAction(title: "취소", style: .cancel){ _ in
            cancelCallback()
        }

        actionSheet.addAction(confirmAction)
        actionSheet.addAction(cancleAction)
        self.present(actionSheet, animated: true)

    }
}

