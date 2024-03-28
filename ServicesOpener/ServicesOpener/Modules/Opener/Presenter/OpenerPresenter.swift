//
//  OpenerPresenter.swift
//  ServicesOpenerWithPinLayout
//
//  Created by Polina Egorova on 28.03.2024.
//

import Foundation

final class OpenerPresenter {
    
    weak var view: OpenerViewInput?

    // MARK: - Private properties
    
    private let interactor: OpenerInteractorInput
    
    // MARK: - Init

    init(interactor: OpenerInteractorInput) {
        self.interactor = interactor
    }
}

extension OpenerPresenter: OpenerViewOutput {
    func setUpAppServices(services: [AppService]?) {
        guard let services = services else {
            DispatchQueue.main.async { [weak self] in
                self?.view?.setUpAppErrorLabel()
            }
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            self?.view?.setUpAppServices(services: services)
        }
    }
}

extension OpenerPresenter: OpenerInteractorOutput {
    func refreshData() {
        interactor.refreshData()
    }
}
