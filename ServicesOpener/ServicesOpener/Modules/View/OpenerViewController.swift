//
//  OpenerViewController.swift
//  ServicesOpener
//
//  Created by Polina Egorova on 28.03.2024.
//

import UIKit

final class OpenerViewController: UIViewController {

    // MARK: - Private properties
    
    private let output: OpenerViewOutput
    private let tableViewDataSource: OpenerTableViewDataSource
    
    // MARK: - Init
    
    init(output: OpenerViewOutput,
         tableViewDataSource: OpenerTableViewDataSource) {
        self.output = output
        self.tableViewDataSource = tableViewDataSource
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
    }
}

extension OpenerViewController: OpenerViewInput {
    
}
