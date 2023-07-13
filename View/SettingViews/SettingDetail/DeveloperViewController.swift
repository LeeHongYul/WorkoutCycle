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
        let emailAddress = "ryullee0911@gmail.com"
        moveToGmail(to: emailAddress)
    }

    func moveToGithub() {
        let urlStr = "https://github.com/LeeHongYul"
        if let url = URL(string: urlStr) {
            UIApplication.shared.open(url)
        }
    }
    //    ryullee0911@gmail.com
    func moveToGmail(to emailAddress: String) {
        if MFMailComposeViewController.canSendMail() {
                let mailComposer = MFMailComposeViewController()
                mailComposer.setToRecipients([emailAddress])
                present(mailComposer, animated: true, completion: nil)
            } else {
                // Handle the case when the device cannot send emails
            }
    }
}
