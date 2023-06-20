//
//  BaseViewController.swift
//  WorkoutCycle
//
//  Created by 이홍렬 on 2023/06/13.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


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

