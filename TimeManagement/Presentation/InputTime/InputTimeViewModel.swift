//
//  InputTimeViewModel.swift
//  TimeManagement
//
//  Created by 小野寺祥吾 on 2024/03/09.
//

protocol InputTimeViewModel {
    /// 時刻情報の保存
    func saveTime(startTime: Int, endTime: Int, targetTime: Int) throws
    /// とある時刻が範囲内に含まれるかを判定する
    func containsTime(startTime: Int, endTime: Int, taretTime: Int) -> Bool
}

class InputTimeViewModelImpl: InputTimeViewModel {
    private var timeUseCase: TimeUseCase = TimeUseCaseImpl()
    
    func saveTime(startTime: Int, endTime: Int, targetTime: Int) throws {
        let contains = containsTime(startTime: startTime, endTime: endTime, taretTime: targetTime)
        let timeInfoRecord = TimeInfoRecord(startTime: startTime, endTime: endTime, targetTime: targetTime, containsTime: contains)
        try timeUseCase.saveTime(timeInfo: timeInfoRecord)
    }
    
    func containsTime(startTime: Int, endTime: Int, taretTime: Int) -> Bool {
        timeUseCase.containsTime(startTime: startTime, endTime: endTime, targetTime: taretTime)
    }
}


