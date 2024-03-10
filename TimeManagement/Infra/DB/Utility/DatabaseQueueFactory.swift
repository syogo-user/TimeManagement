//
//  DatabaseQueueFactory.swift
//  TimeManagement
//
//  Created by 小野寺祥吾 on 2024/03/10.
//

import Foundation
import GRDB

enum DatabaseQueueFactory {

    static func create(definition: DatabaseDefinition) throws -> DatabaseQueue {
        do {
            let databasePath = try generateDatabasePath(dbFileName: definition.dbFileName)
            let dbQueue = try generateDatabaseQueue(dbName: definition.dbName, databasePath: databasePath)
            try definition.migrator.migrate(dbQueue)
            return dbQueue
        } catch {
            try initialize(definition: definition)
            throw DatabaseError.openFailed(error)
        }
    }

    /// DatabaseQueueを生成
    private static func generateDatabaseQueue(dbName: String, databasePath: String) throws -> DatabaseQueue {
        var configuration = Configuration()
        configuration.label = dbName
        return try DatabaseQueue(path:databasePath, configuration: configuration)
    }

    /// データベース保存パス生成
    private static func generateDatabasePath(dbFileName: String) throws -> String {
        try FileManager.default
            .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            .appendingPathComponent(dbFileName).path
    }
    
    /// データベースの初期化
    private static func initialize(definition: DatabaseDefinition) throws {
        do {
            let databasePath = try generateDatabasePath(dbFileName: definition.dbFileName)
            if FileManager.default.fileExists(atPath: databasePath) {
                try FileManager.default.removeItem(atPath: databasePath)
            }
        } catch {
            throw error
        }
    }
}
