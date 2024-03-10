//
//  TimeRepository.swift
//  TimeManagement
//
//  Created by 小野寺祥吾 on 2024/03/10.
//

import Foundation

protocol TimeRepository {
    
}

class TimeRepositoryImpl: TimeRepository {
    private var localStore: TimeLocalStore = TimeLocalStoreImpl()
    
}
