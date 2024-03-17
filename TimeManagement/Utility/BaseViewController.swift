//
//  BaseViewController.swift
//  TimeManagement
//
//  Created by 小野寺祥吾 on 2024/03/16.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showDialog(title: String, message: String, buttonTitle: String, completion: (() -> Void)? = nil) {
        let dialog = UIAlertController(title: title, message: message, preferredStyle: .alert)
        dialog.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: { action in
            completion?()
        }))
        self.present(dialog,animated: true,completion: nil)
    }
}
