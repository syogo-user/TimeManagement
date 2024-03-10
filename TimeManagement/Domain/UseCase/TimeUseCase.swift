//
//  TimeUseCase  .swift
//  TimeManagement
//
//  Created by 小野寺祥吾 on 2024/03/10.
//

import Foundation

protocol TimeUseCase {
    /// とある時刻が範囲内に含まれるかを判定する
    func containsTime(startTime: Int, endTime: Int, targetTime: Int) -> Bool
    /// 時刻情報を保存する
    func saveTime(timeInfo: TimeInfoRecord) throws
    /// 時刻情報を取得する
    func loadTimeInfo() throws -> [TimeInfoItem]
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
    
    func loadTimeInfo() throws -> [TimeInfoItem] {
        do {
            return try repository.loadTimeInfo().map {
                TimeInfoItem(startTime: $0.startTime, endTime: $0.endTime, targetTime: $0.targetTime, containsTime: $0.containsTime)
            }
        } catch {
            throw DomainError.localDbError
        }
    }
}
