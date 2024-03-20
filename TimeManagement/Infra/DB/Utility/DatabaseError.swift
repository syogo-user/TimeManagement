//
//  DatabaseError.swift
//  TimeManagement
//
//  Created by 小野寺祥吾 on 2024/03/10.
//

enum DatabaseError: Error {
    /// DBオープン失敗
    case openFailed(Error)
    /// DBアクセス失敗
    case accessFailed
}
