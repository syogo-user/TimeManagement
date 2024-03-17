//
//  TimeInfoRecord.swift
//  TimeManagement
//
//  Created by 小野寺祥吾 on 2024/03/10.
//

import Foundation
import GRDB

class TimeInfoRecord : Record {
    override class var databaseTableName: String {
        "time_info"
    }
    /// 開始時刻
    let startTime: Int
    /// 終了時刻
    let endTime: Int
    /// とある時刻
    let targetTime: Int
    /// 時刻を含むか
    let containsTime: Bool


    static func setupTable(_ db: Database, _ version: MainDatabase.Versions) throws {
        try db.create(table: databaseTableName, body: { (table:TableDefinition) in
            table.column("time_id", .integer).notNull().primaryKey(onConflict: .replace, autoincrement: true)
            table.column("start_time", .integer).notNull()
            table.column("end_time", .integer).notNull()
            table.column("target_time", .integer).notNull()
            table.column("contains_time", .boolean).notNull()
        })
    }

    enum Columns {
        static let timeId = Column("time_id")
        static let startTime = Column("start_time")
        static let endTime = Column("end_time")
        static let targetTime = Column("target_time")
        static let containsTime = Column("contains_time")
    }

    init(startTime: Int, endTime: Int, targetTime: Int, containsTime: Bool) {
        self.startTime = startTime
        self.endTime = endTime
        self.targetTime = targetTime
        self.containsTime = containsTime
        super.init()
    }

    required init(row: Row) {
        self.startTime = row["start_time"]
        self.endTime = row["end_time"]
        self.targetTime = row["target_time"]
        self.containsTime = row["contains_time"]
        super.init()
    }

    override func encode(to container: inout PersistenceContainer) {
        container["start_time"] = self.startTime
        container["end_time"] = self.endTime
        container["target_time"] = self.targetTime
        container["contains_time"] = self.containsTime
    }
}
