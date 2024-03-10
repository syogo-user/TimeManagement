//
//  TimeInfoDao.swift
//  TimeManagement
//
//  Created by 小野寺祥吾 on 2024/03/10.
//

import Foundation

protocol TimeInfoDao {
    /// 時間情報を保存
    func saveLocalTime() -> [TimeInfoRecord]
}

class TimeInfoDaoImpl: GRDBAccessor, TimeInfoDao {
    func saveLocalTime() -> [TimeInfoRecord] {
        try! readFromDBwith { db in
            try TimeInfoRecord.fetchAll(db)
        }
    }
}
