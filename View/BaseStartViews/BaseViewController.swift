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

    func checkHowManyDayGone() -> Int {
        let target = LatestDayManger.shared.latestDayList // firstDay, latestDay 데이터 접근

        print("처음 날짜: \(Int16(target.first!.firstDay))일, 최근 날짜: \(target.first!.latestDay)일")

        let daysCount = Int16(target.first!.firstDay) - (target.first!.latestDay) // firstDay, latestDay 차 구하기

        let getAbs = abs(Int(daysCount)) // 절댓값으로 변경

//        let getDay = (getAbs) % WorkCycleManger.shared.workCycleList.count //설정된 분할법에서 현재 순서 가져오기

        if Int16(target.first!.firstDay) <= target.first!.latestDay { //ex 12일 < 15일
            let daysCount = Int16(target.first!.firstDay) - (target.first!.latestDay)
            let getAbs = abs(Int(daysCount))

            let getDay = (getAbs) % WorkCycleManger.shared.workCycleList.count
            return getDay
        } else {
            let daysCount = Int16(target.first!.firstDay - 1) - (target.first!.latestDay)
            let getAbs = abs(Int(daysCount))

            let getDay = (getAbs) % WorkCycleManger.shared.workCycleList.count

            let target = LatestDayManger.shared.latestDayList.first
            let target2 = target?.firstDay as? Int

            if let target {
                LatestDayManger.shared.updateTodayDay(update: target, latestDay: target2!)
            }
            
            return getDay
        }
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

            guard let todayWorkout = self.getTodayWork(dayInt:getDayInt) else { return }

            let identifier = "FisrtAlarm"
            let title = "운동갈 시간입니다"
            let message = "오늘 운동 부위: \(todayWorkout)"
            let isDaily = true

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
                        print(error)
                    }
                }

            } else {
                print("알람 권한이 없습니다")
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

