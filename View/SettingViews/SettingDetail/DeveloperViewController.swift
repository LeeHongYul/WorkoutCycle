//
//  DeveloperViewController.swift
//  WorkoutCycle
//
//  Created by 이홍렬 on 2023/06/21.
//

import UIKit
import MessageUI

class DeveloperViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func moveToGithub(_ sender: Any) {
        moveToGithub()
    }

    @IBAction func moveToGmail(_ sender: Any) {
        openGmail()
    }

    func moveToGithub() {
        let urlStr = "https://github.com/LeeHongYul"
        if let url = URL(string: urlStr) {
            UIApplication.shared.open(url)
        }
    }

    func openGmail() {
        if MFMailComposeViewController.canSendMail() {
                let composeVC = MFMailComposeViewController()
                composeVC.mailComposeDelegate = self
                composeVC.setToRecipients([""]) // 이메일 수신자 설정
                composeVC.setSubject("") // 이메일 제목 설정
                composeVC.setMessageBody("", isHTML: false) // 이메일 본문 설정
                self.present(composeVC, animated: true, completion: nil)
            } else {
                ValidationError.cancel
            }
    }
}

extension DeveloperViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
            self.dismiss(animated: true, completion: nil)
        }
}
