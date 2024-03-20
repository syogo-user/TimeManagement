//
//  TimeListViewModel.swift
//  TimeManagement
//
//  Created by 小野寺祥吾 on 2024/03/09.
//

protocol TimeListViewModel {
    /// 時刻情報のリストを取得する
    func loadTimeList() throws -> [TimeInfoItem]
}


class TimeListViewModelImpl: TimeListViewModel {
    private var timeUseCase: TimeUseCase = TimeUseCaseImpl()
    
    func loadTimeList() throws -> [TimeInfoItem] {
        let items = try timeUseCase.loadTimeInfo()
        return items
    }
}
