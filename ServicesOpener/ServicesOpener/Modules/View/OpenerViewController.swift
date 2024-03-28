//
//  OpenerViewController.swift
//  ServicesOpener
//
//  Created by Polina Egorova on 28.03.2024.
//

import UIKit

final class OpenerViewController: UIViewController {

    // MARK: - Private properties
    
    private enum ControllerConstants {
        static let errorLabelText: String = "Сервисы не найдены"
        static let cellIdentifier: String = "OpenerTableViewCell"
    }
    
    private let output: OpenerViewOutput
    private let tableViewDataSource: OpenerTableViewDataSource
    
    private var tableView: UITableView
    private var errorLabel: UILabel
    private var refreshControl: UIRefreshControl
    
    // MARK: - Init
    
    init(output: OpenerViewOutput,
         tableViewDataSource: OpenerTableViewDataSource) {
        self.output = output
        self.tableViewDataSource = tableViewDataSource
        
        self.tableView = UITableView().autolayout()
        self.errorLabel = UILabel().autolayout()
        self.refreshControl = UIRefreshControl().autolayout()
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        configureViews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: any UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        tableView.reloadData()
    }
    
    // MARK: - Private functions
    
    private func setUpUI() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        view.addSubview(errorLabel)
        NSLayoutConstraint.activate([
            errorLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            errorLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func configureViews() {
        view.backgroundColor = .systemBackground
        
        tableView.register(OpenerTableViewCell.self, forCellReuseIdentifier: ControllerConstants.cellIdentifier)
        tableView.delegate = tableViewDataSource
        tableView.dataSource = tableViewDataSource
        tableView.separatorStyle = .none
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        
        errorLabel.isHidden = true
        errorLabel.text = ControllerConstants.errorLabelText
        errorLabel.textColor = .systemGray3
    }
    
    @objc private func refreshData() {
        output.refreshData()
    }
}

extension OpenerViewController: OpenerViewInput {
    func setUpAppServices(services: [AppService]) {
        tableViewDataSource.update(
            with: services,
            tableView: tableView
        )
        refreshControl.endRefreshing()
        errorLabel.isHidden = true
    }
    
    func setUpAppErrorLabel() {
        tableViewDataSource.update(
            with: [],
            tableView: tableView
        )
        refreshControl.endRefreshing()
        errorLabel.isHidden = false
    }
}

