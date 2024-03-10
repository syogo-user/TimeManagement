//
//  TimeUseCase  .swift
//  TimeManagement
//
//  Created by 小野寺祥吾 on 2024/03/10.
//

import Foundation

protocol TimeUseCase {
    /// 時刻情報を保存する
    func saveTime(timeInfo: TimeInfoRecord) throws
    /// とある時刻が範囲内に含まれるかを判定する
    func containsTime(startTime: Int, endTime: Int, targetTime: Int) -> Bool
}

class TimeUseCaseImpl: TimeUseCase {
    private var repository: TimeRepository = TimeRepositoryImpl()
    
    func containsTime(startTime: Int, endTime: Int, targetTime: Int) -> Bool {
        if startTime == endTime && startTime == targetTime {
            return true
        } else if startTime < endTime {
            return targetTime >= startTime && targetTime < endTime
        } else if startTime > endTime {
            return targetTime >= startTime || targetTime < endTime
        } else {
            return false
        }
    }
    
    func saveTime(timeInfo: TimeInfoRecord) throws {
        do {
            return try repository.saveTime(timeInfo: timeInfo)
        } catch {
            throw DomainError.localDbError
        }        
    }
}
