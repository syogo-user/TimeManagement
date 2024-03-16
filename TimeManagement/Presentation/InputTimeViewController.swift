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
        // あとでバリデーションする
        guard let timeValue = validation() else { return }
        let contains = viewModel.containsTime(startTime: timeValue.0, endTime: timeValue.1, taretTime: timeValue.2)
        self.includeStateLabel.text = contains ? R.string.localizable.includeStateContain() : R.string.localizable.includeStateNotContain()
    }
    
    @IBAction func save(_ sender: Any) {
        // あとでバリデーションする
        guard let timeValue = validation() else { return }
        
        do {
            try viewModel.saveTime(startTime: timeValue.0, endTime: timeValue.1, targetTime: timeValue.2)
            // 画面を閉じる
        } catch {
            // あとでエラーを表示する
        }
    }
    
    private func validation() -> (Int, Int, Int)? {
        guard let startTime = startTimeTextField.text,
              let endTime = endTimeTextField.text,
              let targetTime = targetTimeTextField.text
        else { return nil }
        
        guard let startTime = Int(startTime),
              let endTime = Int(endTime),
              let targetTime = Int(targetTime)
        else { return nil }
        
        return (startTime, endTime, targetTime)
    }
}

