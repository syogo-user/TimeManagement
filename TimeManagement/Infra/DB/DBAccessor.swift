//
//  DBAccessor.swift
//  TimeManagement
//
//  Created by 小野寺祥吾 on 2024/03/10.
//

import GRDB

protocol DBAccessor {
    /// 時刻情報
    var timeInfoDao: TimeInfoDao { get }
}

class GRDBAccessor {
    func readFromDBwith<T>(_ operation: @escaping ((GRDB.Database) throws -> (T))) throws -> T {
        try MainDatabase.shared.dbQueueSingle().read { db in
           try operation(db)
        }
    }
    
    func writeToDBwith(_ operation: @escaping ((GRDB.Database) throws -> Void)) throws -> Void {
        try MainDatabase.shared.dbQueueSingle().write { db in
            try operation(db)
        }
    }
}

extension GRDBAccessor: DBAccessor {
    var timeInfoDao: TimeInfoDao {
        TimeInfoDaoImpl()
    }
}
