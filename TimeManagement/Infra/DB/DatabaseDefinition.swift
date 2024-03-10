//
//  DatabaseDefinition.swift
//  TimeManagement
//
//  Created by 小野寺祥吾 on 2024/03/10.
//

import Foundation
import GRDB

protocol DatabaseDefinition {
    /// データベース名
    var dbName: String { get }
    /// データファイル名
    var dbFileName: String { get }
    /// マイグレーション
    var migrator: DatabaseMigrator { get }
}
