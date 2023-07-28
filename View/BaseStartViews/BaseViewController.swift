//
//  BaseViewController.swift
//  WorkoutCycle
//
//  Created by 이홍렬 on 2023/06/13.
//

import UIKit
import UserNotifications

class BaseViewController: UIViewController {

    let calendar = Calendar.current

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(forName: .doneUpdateDate, object: nil, queue: .main) { noti in
            self.grantedNotification(18, 0)
        }
    }

    func checkHowManyDayGone() -> Int {
        let target = DayCheckManger.shared.dayCheckList // firstDay, latestDay 데이터 접근

        guard let safeTarget = target.first else { return 0 }

        let firstDay = safeTarget.firstDay
        let latestDay = safeTarget.latestDay

        let daysCount =  calendar.dateComponents([.day], from: firstDay!, to: latestDay!)// firstDay, latestDay 차 구하기

        let resultDayCount = (daysCount.day!) % WorkCycleManger.shared.workCycleList.count

        return resultDayCount
    }

    func getTodayWork(dayInt: Int) -> String? {
        let target = WorkCycleManger.shared.workCycleList[dayInt].name
        return target
    }

    func checkPermission() {
        let notiCenter = UNUserNotificationCenter.current()

        notiCenter.getNotificationSettings { setting in
            switch setting.authorizationStatus {
            case .notDetermined:
                notiCenter.requestAuthorization(options: [.alert, .sound]) { permissionGranted, error in
                    if permissionGranted {
                        self.grantedNotification(18, 0)
                    }
                }
            case .denied:
                return
            case .authorized:
                self.grantedNotification(18, 0)
            @unknown default:
                return
            }
        }
    }

    func grantedNotification(_ hour: Int, _ minute: Int) {
        let notiCenter = UNUserNotificationCenter.current()
        let getDayInt = checkHowManyDayGone()

        notiCenter.getNotificationSettings { setting in

            let identifier = "FisrtAlarm"
            let title = "운동갈 시간입니다"
            let message = "오늘 운동 화이팅!"

            if (setting.authorizationStatus == .authorized) {
                let content = UNMutableNotificationContent()

                content.title = title
                content.body = message
                content.sound = .default

                let calendar = Calendar.current
                var dateComponents = DateComponents(calendar: calendar, timeZone: TimeZone.current)

                dateComponents.hour = hour
                dateComponents.minute = minute

                let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)

                let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)

                notiCenter.removePendingNotificationRequests(withIdentifiers: [identifier])
                UNUserNotificationCenter.current().add(request) { error in
                    if let error {
                        ValidationError.cancel
                    }
                }
            } else {
                ValidationError.noAuthority
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

    func showActionSheet(title: String,
                         message: String,
                         confrimStyle:  UIAlertAction.Style,
                         callback: @escaping () -> Void,
                         cancelCallback : @escaping () -> Void) {
        let actionSheet = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)

        let confirmAction = UIAlertAction(title: "확인", style: confrimStyle){ _ in
            callback()
        }

        let cancleAction = UIAlertAction(title: "취소", style: .cancel){ _ in
            cancelCallback()
        }

        actionSheet.addAction(confirmAction)
        actionSheet.addAction(cancleAction)
        self.present(actionSheet, animated: true)
    }

    func showOneAlert(title: String,
                      cancelCallback : @escaping () -> Void) {
        let alert = UIAlertController(title: title, message: "", preferredStyle: .alert)

        let cancleAction = UIAlertAction(title: "확인", style: .cancel){ _ in
            cancelCallback()
        }
        alert.addAction(cancleAction)
        self.present(alert, animated: true)
    }
}

