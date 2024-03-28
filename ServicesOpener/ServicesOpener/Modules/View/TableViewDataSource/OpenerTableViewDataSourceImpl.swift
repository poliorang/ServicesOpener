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
        static let cellHeight: CGFloat = 50
    }
    
//    private var forecasts: [Forecast]?
    private weak var tableView: UITableView?

    // MARK: - Init
    
    override init() {
        super.init()
    }
    
    private func setupTableAppearance() {
        tableView?.backgroundColor = .clear
        tableView?.layer.cornerRadius = 16
//        tableView?.contentInset = UIEdgeInsets(top: 6, left: 0, bottom: 0, right: 0)
    }
}

extension OpenerTableViewDataSourceImpl: OpenerTableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0//forecasts?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewConstants.cellIdentifier, for: indexPath) as? OpenerTableViewCell else {
            assertionFailure("Failed to set tableview cell")
            return UITableViewCell()
        }
        
//        let forecast = forecasts?[indexPath.row]
//        cell.configure(forecast: forecast)
//        cell.setUpUI()
        
        return cell
    }
    

//    func update(with forecasts: [Forecast]?,
//                tableView: UITableView
//    ) {
//        self.forecasts = forecasts
//        self.tableView = tableView
//        
//        setupTableAppearance()
//    
//        DispatchQueue.main.async {
//            tableView.reloadData()
//        }
//    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return TableViewConstants.cellHeight
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return TableViewConstants.cellHeight
    }
}

