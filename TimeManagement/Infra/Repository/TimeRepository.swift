//
//  TimeRepository.swift
//  TimeManagement
//
//  Created by 小野寺祥吾 on 2024/03/10.
//

import Foundation

protocol TimeRepository {
    
    func saveTime(timeInfo: TimeInfoRecord) throws
    
    func loadTimeInfo() throws -> [TimeInfoRecord]
}

class TimeRepositoryImpl: TimeRepository {
    private var localStore: TimeLocalStore = TimeLocalStoreImpl()
    
    func saveTime(timeInfo: TimeInfoRecord) throws {
        try localStore.saveLocalTime(timeInfo: timeInfo)
    }
    
    func loadTimeInfo() throws -> [TimeInfoRecord] {
        try localStore.loadTimeInfo()
    }
}
