//
//  InputTimeViewModel.swift
//  TimeManagement
//
//  Created by 小野寺祥吾 on 2024/03/09.
//

import Foundation

protocol InputTimeViewModel {
    
    func saveTime(startTime: Int, endTime: Int, targetTime: Int) throws
    
    func containsTime(startTime: Int, endTime: Int, taretTime: Int) -> Bool
}


class InputTimeViewModelImpl: InputTimeViewModel {
    private var timeUseCase: TimeUseCase = TimeUseCaseImpl()
    
    func saveTime(startTime: Int, endTime: Int, targetTime: Int) throws {
        let isContains = containsTime(startTime: startTime, endTime: endTime, taretTime: targetTime)
        let timeInfoRecord = TimeInfoRecord(startTime: startTime, endTime: endTime, targetTime: targetTime, containsTime: isContains)
        try timeUseCase.saveTime(timeInfo: timeInfoRecord)
    }
    
    func containsTime(startTime: Int, endTime: Int, taretTime: Int) -> Bool {
        timeUseCase.containsTime(startTime: startTime, endTime: endTime, targetTime: taretTime)
    }
}


