//
//  OpenerTableViewDataSource.swift
//  ServicesOpenerWithPinLayout
//
//  Created by Polina Egorova on 28.03.2024.
//

import UIKit

protocol OpenerTableViewDataSource: UITableViewDataSource, UITableViewDelegate {
    func update(with appServices: [AppService], 
                tableView: UITableView)
}
