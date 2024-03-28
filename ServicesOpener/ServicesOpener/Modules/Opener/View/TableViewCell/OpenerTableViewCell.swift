//
//  OpenerTableViewCell.swift
//  ServicesOpenerWithPinLayout
//
//  Created by Polina Egorova on 28.03.2024.
//

import UIKit

final class OpenerTableViewCell: UITableViewCell {

    // MARK: - Private properties
    
    private var appServiceIconImageView: UIImageView
    private var appServiceNameLabel: UILabel
    private var appServiceDescriptionLabel: UILabel
    private var appServiceControlImageView: UIImageView
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        self.appServiceIconImageView = UIImageView().autolayout()
        self.appServiceNameLabel = UILabel().autolayout()
        self.appServiceDescriptionLabel = UILabel().autolayout()
        self.appServiceControlImageView = UIImageView().autolayout()
    
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func prepareForReuse() {
        appServiceIconImageView.image = nil
        appServiceNameLabel.text = nil
        appServiceDescriptionLabel.text = nil
    }
    
    // MARK: - Public functions
    
    public func setUpUI() {
        setupInitialLayout()
        configureViews()
    }
    
    public func configure(appService: AppService) {
        appServiceNameLabel.text = appService.name
        appServiceDescriptionLabel.text = appService.description
        appServiceIconImageView.image = appService.icon
    }
    
    // MARK: - Private functions

    private func setupInitialLayout() {
        contentView.addSubview(appServiceIconImageView)
        NSLayoutConstraint.activate([
            appServiceIconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            appServiceIconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            appServiceIconImageView.heightAnchor.constraint(equalToConstant: 60),
            appServiceIconImageView.widthAnchor.constraint(equalToConstant: 60)
        ])
        
        contentView.addSubview(appServiceNameLabel)
        NSLayoutConstraint.activate([
            appServiceNameLabel.topAnchor.constraint(equalTo: appServiceIconImageView.topAnchor),
            appServiceNameLabel.leadingAnchor.constraint(equalTo: appServiceIconImageView.trailingAnchor, constant: 15),
            appServiceNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
        
        contentView.addSubview(appServiceDescriptionLabel)
        NSLayoutConstraint.activate([
            appServiceDescriptionLabel.topAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -5),
            appServiceDescriptionLabel.leadingAnchor.constraint(equalTo: appServiceIconImageView.trailingAnchor, constant: 15),
            appServiceDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50)
        ])
        
        contentView.addSubview(appServiceControlImageView)
        NSLayoutConstraint.activate([
            appServiceControlImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            appServiceControlImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            appServiceControlImageView.heightAnchor.constraint(equalToConstant: 16),
            appServiceControlImageView.widthAnchor.constraint(equalToConstant: 16)
        ])
    }
    
    private func configureViews() {
        contentView.backgroundColor = .systemBackground
        appServiceDescriptionLabel.font = UIFont.systemFont(ofSize: 12)
        appServiceDescriptionLabel.numberOfLines = 3
        appServiceIconImageView.backgroundColor = .clear
        appServiceControlImageView.image = UIImage(systemName: "control")!
        appServiceControlImageView.tintColor = .systemGray3
        appServiceControlImageView.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
    }
}
