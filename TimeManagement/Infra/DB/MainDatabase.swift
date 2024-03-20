//
//  MainDatabase.swift
//  TimeManagement
//
//  Created by 小野寺祥吾 on 2024/03/10.
//

import GRDB

final class MainDatabase {
    struct Definition: DatabaseDefinition {
        let dbName: String = "MainDatabase"
        let dbFileName: String = "main.sqlite"
        let migrator = DatabaseMigrator.mainDatabase
    }

    static let shared = MainDatabase()
    private init() {}

    enum Versions: String {
        case v1
    }

    private var _dbQueue: DatabaseQueue?

    func dbQueue() throws -> DatabaseQueue {
        guard let dbQueue = _dbQueue else {
            throw DatabaseError.accessFailed
        }
        return dbQueue
    }

    func dbQueueSingle() -> DatabaseQueue {
        return try! dbQueue()
    }
    
    func open() throws {
        let dbQueue = try DatabaseQueueFactory.create(definition: Definition())
        self._dbQueue = dbQueue
    }
}

extension DatabaseMigrator {
    static var mainDatabase: DatabaseMigrator {
        var databaseMigrator = DatabaseMigrator()
        databaseMigrator.registerMigration(.v1) { db, version in
            try TimeInfoRecord.setupTable(db, version)
        }
        return databaseMigrator
    }
}

private extension DatabaseMigrator {
    mutating func registerMigration(_ version: MainDatabase.Versions, migrate: @escaping(Database, MainDatabase.Versions) throws -> Void) {
        registerMigration(version.rawValue) {
            try migrate($0, version)
        }

    }
}
