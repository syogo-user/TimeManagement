//
//  TimeInfoItem.swift
//  TimeManagement
//
//  Created by 小野寺祥吾 on 2024/03/10.
//

class TimeInfoItem {
    /// 開始時刻
    let startTime: Int
    /// 終了時刻
    let endTime: Int
    /// とある時刻
    let targetTime: Int
    /// 時刻を含むか
    let containsTime: Bool
    
    init(startTime: Int, endTime: Int, targetTime: Int, containsTime: Bool) {
        self.startTime = startTime
        self.endTime = endTime
        self.targetTime = targetTime
        self.containsTime = containsTime
    }
}
