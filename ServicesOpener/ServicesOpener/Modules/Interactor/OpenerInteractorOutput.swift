//
//  OpenerInteractorOutput.swift
//  ServicesOpenerWithPinLayout
//
//  Created by Polina Egorova on 28.03.2024.
//

protocol OpenerInteractorOutput: AnyObject {
    func setUpAppServices(services: [AppService]?)
    
    func refreshData()
}
