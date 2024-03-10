//
//  TimeListViewController.swift
//  TimeManagement
//
//  Created by 小野寺祥吾 on 2024/03/09.
//

import UIKit

class TimeListViewController: UIViewController {
    private var viewModel: TimeListViewModel = TimeListViewModelImpl()
    private var tableViewItems: [TimeInfoItem] = []
    private let cellId = "cell"
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "TimeInfoTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellId)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        do {
            let items = try viewModel.loadTimeList()
            tableViewItems = items
            tableView.reloadData()
        } catch {
            // あとで追加 エラーメッセージ表示
        }
    }
    
    @IBAction func registerTimeInfo(_ sender: Any) {

    }
}

extension TimeListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TimeInfoTableViewCell
        cell.setLayout(timeInfo: tableViewItems[indexPath.row])
        return cell
    }
}
