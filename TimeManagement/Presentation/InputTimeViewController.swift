//
//  ViewController.swift
//  TimeManagement
//
//  Created by 小野寺祥吾 on 2024/03/09.
//

import UIKit

class InputTimeViewController: UIViewController {

    @IBOutlet private weak var startTimeTextField: UITextField!
    @IBOutlet private weak var endTimeTextField: UITextField!
    @IBOutlet private weak var targetTimeTextField: UITextField!
    @IBOutlet private weak var includeStateLabel: UILabel!
    private var viewModel: InputTimeViewModel = InputTimeViewModelImpl()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func judgement(_ sender: Any) {
        
    }
    
    @IBAction func save(_ sender: Any) {
        // あとでバリデーションする
        guard let startTime = startTimeTextField.text,
              let endTime = endTimeTextField.text,
              let targetTime = targetTimeTextField.text
        else { return }
        
        guard let startTime = Int(startTime),
              let endTime = Int(endTime),
              let targetTime = Int(targetTime)
        else { return }
        
        do {
            try viewModel.saveTime(startTime: startTime, endTime: endTime, targetTime: targetTime)
            // 画面を閉じる
        } catch {
            // あとでエラーを表示する
        }
    }
}

