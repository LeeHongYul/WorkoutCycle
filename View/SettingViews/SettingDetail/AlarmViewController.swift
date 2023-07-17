//
//  AlarmViewController.swift
//  WorkoutCycle
//
//  Created by 이홍렬 on 2023/06/21.
//

import UIKit

class AlarmViewController: BaseViewController {

    let notiCenter = UNUserNotificationCenter.current()

    @IBOutlet var alarmSwitch: UISwitch!
    @IBOutlet var alarmDatePicker: UIDatePicker!

    @IBAction func alarmSwitch(_ sender: Any) {
        let notiCenter = UNUserNotificationCenter.current()

        if alarmSwitch.isOn {
            notiCenter.getNotificationSettings { setting in
                switch setting.authorizationStatus {

                case .denied, .authorized, .notDetermined:
                    notiCenter.requestAuthorization(options: [.alert, .sound]) { permissionGranted, error in
                        if permissionGranted {
                            self.grantedNotification(18, 0)
                            print("Noti granted")
                        }
                    }
                @unknown default:
                    return
                }
            }
        } else {

            guard let url = URL(string: UIApplication.openSettingsURLString) else { return }

            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        }
    }

    @IBAction func alarmDatePicker(_ sender: Any) {
        grantedNotification(alarmDatePicker.date.hour, alarmDatePicker.date.minute)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
