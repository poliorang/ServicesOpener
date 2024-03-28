//
//  OpenerViewInput.swift
//  ServicesOpener
//
//  Created by Polina Egorova on 28.03.2024.
//

protocol OpenerViewInput: AnyObject {
    func setUpAppServices(services: [AppService])
    
    func setUpAppErrorLabel()
}
