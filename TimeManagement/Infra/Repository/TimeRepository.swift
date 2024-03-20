//
//  TimeRepository.swift
//  TimeManagement
//
//  Created by 小野寺祥吾 on 2024/03/10.
//

protocol TimeRepository {
    /// 時刻情報を保存
    func saveTime(timeInfo: TimeInfoRecord) throws
    /// 時刻情報を取得
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
