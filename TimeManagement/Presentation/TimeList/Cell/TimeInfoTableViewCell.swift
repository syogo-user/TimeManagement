//
//  TimeInfoTableViewCell.swift
//  TimeManagement
//
//  Created by 小野寺祥吾 on 2024/03/10.
//

import UIKit

class TimeInfoTableViewCell: UITableViewCell {
    @IBOutlet private weak var startTimeLabel: UILabel!
    @IBOutlet private weak var endTimeLabel: UILabel!
    @IBOutlet private weak var targetTimeLabel: UILabel!
    @IBOutlet private weak var containsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setLayout(timeInfo: TimeInfoItem){
        self.startTimeLabel.text = R.string.localizable.startTimeText(timeInfo.startTime.description)
        self.endTimeLabel.text = R.string.localizable.endTimeText(timeInfo.endTime.description)
        self.targetTimeLabel.text = R.string.localizable.targetTimeText(timeInfo.targetTime.description)
        self.containsLabel.text =  timeInfo.containsTime ? R.string.localizable.includeStateContain() : R.string.localizable.includeStateNotContain()
    }
}
