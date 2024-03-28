//
//  OpenerTableViewCell.swift
//  ServicesOpener
//
//  Created by Polina Egorova on 28.03.2024.
//

import UIKit
import PinLayout

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
    
    override func layoutSubviews() {

        appServiceIconImageView.pin
            .left(20)
            .height(60)
            .width(60)
            .vCenter()
        
        appServiceControlImageView.pin
            .right(15)
            .height(16)
            .width(16)
            .vCenter()
            .sizeToFit()
        
        appServiceNameLabel.pin
            .after(of: appServiceIconImageView, aligned: .top)
            .before(of: appServiceControlImageView)
            .marginHorizontal(15)
            .sizeToFit()
        
        appServiceDescriptionLabel.pin
            .after(of: appServiceIconImageView, aligned: .center)
            .before(of: appServiceControlImageView)
            .marginTop(12)
            .marginHorizontal(15)
            .sizeToFit(.width)
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
        contentView.addSubview(appServiceNameLabel)
        contentView.addSubview(appServiceDescriptionLabel)
        contentView.addSubview(appServiceControlImageView)
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
