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
        self.startTimeLabel.text = "開始時刻:" + timeInfo.startTime.description
        self.endTimeLabel.text = "終了時刻:" + timeInfo.endTime.description
        self.targetTimeLabel.text = "対象の時刻:" + timeInfo.targetTime.description
        self.containsLabel.text =  timeInfo.containsTime ? "含む" : "含まない"
    }
}
