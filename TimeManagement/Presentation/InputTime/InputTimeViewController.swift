//
//  ViewController.swift
//  TimeManagement
//
//  Created by 小野寺祥吾 on 2024/03/09.
//

import UIKit

class InputTimeViewController: BaseViewController {
    @IBOutlet private weak var startTimeTextField: UITextField!
    @IBOutlet private weak var endTimeTextField: UITextField!
    @IBOutlet private weak var targetTimeTextField: UITextField!

    private var viewModel: InputTimeViewModel = InputTimeViewModelImpl()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction private func judgement(_ sender: Any) {
        guard let timeValue = validation() else { return }
        let contains = viewModel.containsTime(startTime: timeValue.0, endTime: timeValue.1, taretTime: timeValue.2)
        showContainsResultDialog(contains: contains)
    }
    
    @IBAction private func save(_ sender: Any) {
        guard let timeValue = validation() else { return }
            
        do {
            try viewModel.saveTime(startTime: timeValue.0, endTime: timeValue.1, targetTime: timeValue.2)
            dismiss(animated: true)
        } catch {
            showSaveErrorDialog()
        }
    }
    
    @IBAction private func dismiss(_ sender: Any) {
        dismiss(animated: true)
    }
    
    private func validation() -> (Int, Int, Int)? {
        guard let startTimeText = startTimeTextField.text,
              let endTimeText = endTimeTextField.text,
              let targetTimeText = targetTimeTextField.text
        else { return nil }
        
        let startTime = Int(startTimeText)
        let endTime = Int(endTimeText)
        let targetTime = Int(targetTimeText)
        let timeItems: [(String, Int?)] = [(R.string.localizable.startTime(), startTime), (R.string.localizable.endTime(), endTime), (R.string.localizable.targetTime(), targetTime)]
        
        var invalidItems: [String] = []
        timeItems.forEach { (key: String, time: Int?) in
            if let time = time {
                if invalidTime(time: time) {
                    invalidItems.append(key)
                }
            } else {
                invalidItems.append(key)
            }
        }
        
        if !invalidItems.isEmpty {
            let invalidValue = invalidItems.joined(separator: ",")
            showValidationResultDialog(invalidValue: invalidValue)
            return nil
        }
        
        guard let startTime = startTime,
              let endTime = endTime,
              let targetTime = targetTime
        else { return nil }
            
        return (startTime, endTime, targetTime)
    }
    
    private func invalidTime(time: Int) -> Bool {
        if 0 <= time && time <= 23 {
            return false
        } else {
            return true
        }
    }

    private func showValidationResultDialog(invalidValue: String) {
        showDialog(
            title: R.string.localizable.inputErrorTitle(),
            message: R.string.localizable.inputErrorMessage(invalidValue, invalidValue),
            buttonTitle: R.string.localizable.ok()
        )
    }
    
    private func showContainsResultDialog(contains: Bool) {
        showDialog(
            title: R.string.localizable.containsResultTitle(),
            message: contains ? R.string.localizable.includeStateContain() : R.string.localizable.includeStateNotContain(),
            buttonTitle: R.string.localizable.ok()
        )
    }
    
    private func showSaveErrorDialog() {
        self.showDialog(
            title: R.string.localizable.saveErrorTitle(),
            message: R.string.localizable.saveErrorMessage(),
            buttonTitle: R.string.localizable.ok()
        )
    }
}

