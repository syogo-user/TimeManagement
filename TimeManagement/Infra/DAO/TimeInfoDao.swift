//
//  TimeInfoDao.swift
//  TimeManagement
//
//  Created by 小野寺祥吾 on 2024/03/10.
//

import Foundation

protocol TimeInfoDao {
    /// 時間情報を保存
    func saveLocalTime(timeInfo: TimeInfoRecord) throws
    
    /// 時間情報を取得
    func loadTimeInfo() -> [TimeInfoRecord]
}

class TimeInfoDaoImpl: GRDBAccessor, TimeInfoDao {
    func saveLocalTime(timeInfo: TimeInfoRecord) throws {
        try writeToDBwith { db in
            try timeInfo.insert(db)
        }
    }
    
    func loadTimeInfo() -> [TimeInfoRecord] {
        try! readFromDBwith { db in
            try TimeInfoRecord.fetchAll(db)
        }
    }
}