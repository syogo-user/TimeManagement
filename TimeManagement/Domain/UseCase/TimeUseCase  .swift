//
//  TimeUseCase  .swift
//  TimeManagement
//
//  Created by 小野寺祥吾 on 2024/03/10.
//

import Foundation

protocol TimeUseCase {
    /// とある時刻が範囲内に含まれるかを判定する
    func containsTime(targetTime: Int, startTime: Int, endTime: Int) -> Bool
}

class TimeUseCaseImpl: TimeUseCase {
    private var repository: TimeRepository = TimeRepositoryImpl()
    
    func containsTime(targetTime: Int, startTime: Int, endTime: Int) -> Bool {
       return true
    }
    
    func saveTime() {
        
    }
}
