//
//  OpenerTableViewDataSourceImpl.swift
//  ServicesOpener
//
//  Created by Polina Egorova on 28.03.2024.
//

import UIKit

final class OpenerTableViewDataSourceImpl: NSObject {
    
    // MARK: - Private properties
    
    private enum TableViewConstants {
        static let cellIdentifier: String = "OpenerTableViewCell"
        static let headerText: String = "Сервисы"
        static let cellHeight: CGFloat = 80
        static let headerHeight: CGFloat = 35
    }
    
    private var appServices: [AppService]?
    private weak var tableView: UITableView?

    // MARK: - Init
    
    override init() {        
        super.init()
    }
    
    private func setUpTableView() {
        tableView?.separatorStyle = .none
    }
}

extension OpenerTableViewDataSourceImpl: OpenerTableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appServices?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewConstants.cellIdentifier, for: indexPath) as? OpenerTableViewCell,
              let appService = appServices?[indexPath.row] else {
            assertionFailure("Failed to set tableview cell")
            return UITableViewCell()
        }
        
        cell.configure(appService: appService)
        cell.setUpUI()
        
        return cell
    }
    

    func update(with appServices: [AppService],
                tableView: UITableView
    ) {
        self.appServices = appServices
        self.tableView = tableView
    
        DispatchQueue.main.async { [weak self] in
            self?.setUpTableView()
            self?.tableView?.reloadData()
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return TableViewConstants.cellHeight
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return TableViewConstants.cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let appService = appServices?[indexPath.row] else {
            assertionFailure("Failed to set tableview cell")
            return
        }
        
        DispatchQueue.main.async {
            if let url = URL(string: appService.link) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerLabel = UILabel()
        headerLabel.backgroundColor = .systemBackground
        headerLabel.text = TableViewConstants.headerText
        headerLabel.textAlignment = .center
        
        return headerLabel
    }
        
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return TableViewConstants.headerHeight
    }
}

