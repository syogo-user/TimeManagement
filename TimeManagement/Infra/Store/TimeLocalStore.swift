//
//  TimeLocalStore.swift
//  TimeManagement
//
//  Created by 小野寺祥吾 on 2024/03/10.
//

protocol TimeLocalStore {
    /// 時刻情報を保存
    func saveLocalTime(timeInfo: TimeInfoRecord) throws    
    /// 時刻情報を取得
    func loadTimeInfo() throws -> [TimeInfoRecord]
}

class TimeLocalStoreImpl: TimeLocalStore {
    private let accessor: DBAccessor = GRDBAccessor()
    
    func saveLocalTime(timeInfo: TimeInfoRecord) throws {
        try accessor.timeInfoDao.saveLocalTime(timeInfo: timeInfo)
    }
    
    func loadTimeInfo() -> [TimeInfoRecord] {
        accessor.timeInfoDao.loadTimeInfo()
    }
}
