//
//  TimeLocalStore.swift
//  TimeManagement
//
//  Created by 小野寺祥吾 on 2024/03/10.
//

import Foundation

protocol TimeLocalStore {
    /// 時間情報を保存
    func saveLocalTime(timeInfo: TimeInfoRecord) throws
    
    /// 時間情報を取得
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