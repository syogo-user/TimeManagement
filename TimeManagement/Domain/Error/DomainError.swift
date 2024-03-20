//
//  DomainError.swift
//  TimeManagement
//
//  Created by 小野寺祥吾 on 2024/03/10.
//

enum DomainError: Error {
    /// ローカルDBに関するエラー
    case localDbError
    /// その他のエラー
    case unKnownError
}
