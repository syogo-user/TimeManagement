//
//  TimeListViewController.swift
//  TimeManagement
//
//  Created by 小野寺祥吾 on 2024/03/09.
//

import UIKit

class TimeListViewController: BaseViewController {
    private var viewModel: TimeListViewModel = TimeListViewModelImpl()
    private var tableViewItems: [TimeInfoItem] = []
    private let refreshCtl = UIRefreshControl()
    private let cellId = "cellId"
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var emptyMessageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.refreshControl = refreshCtl
        refreshCtl.addTarget(self, action: #selector(refresh(sender:)), for: .valueChanged)
        let nib = UINib(nibName: R.nib.timeInfoTableViewCell.name, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellId)
        tableView.tableFooterView = UIView() 
        navigationItem.title = R.string.localizable.timeListTitle()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadTimeList()
    }
    
    @IBAction func registerTimeInfo(_ sender: Any) {
        guard let vc = R.storyboard.inputTime.inputTimeVC() else { return }
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    @objc 
    private func refresh(sender: UIRefreshControl) {
        loadTimeList()
        refreshCtl.endRefreshing()
    }
    
    private func setupEmptyMessage() {
        if tableViewItems.isEmpty {
            emptyMessageLabel.isHidden = false
        } else {
            emptyMessageLabel.isHidden = true
        }
    }
    
    private func loadTimeList() {
        do {
            let items = try viewModel.loadTimeList()
            tableViewItems = items.reversed()
            tableView.reloadData()
            setupEmptyMessage()
        } catch {
            showLoadErrorDialog()
        }
    }
    
    private func showLoadErrorDialog() {
        showDialog(
            title: R.string.localizable.loadErrorTitle(),
            message: R.string.localizable.loadErrorMessage(),
            buttonTitle: R.string.localizable.ok()
        )
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
