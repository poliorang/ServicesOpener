//
//  OpenerTableViewCell.swift
//  ServicesOpener
//
//  Created by Polina Egorova on 28.03.2024.
//

import UIKit

final class OpenerTableViewCell: UITableViewCell {

    // MARK: - Private properties

    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func layoutSubviews() {
        
    }
    
    override func prepareForReuse() {
        
    }
    
    // MARK: - Public functions
    
    public func setUpUI() {
        setupInitialLayout()
    }
    
    public func configure() {
        
    }
    
    // MARK: - Private functions

    private func setupInitialLayout() {
        
    }
}
