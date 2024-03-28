//
//  OpenerPresenter.swift
//  ServicesOpener
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
    
    // MARK: - Private functions
    
//    private func setUpDateLabel() {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = Constants.dateFormat
//        let currentDate = Date()
//        let formattedDate = dateFormatter.string(from: currentDate)
//
//        view?.configureDateLabel(text: formattedDate)
//    }
}

extension OpenerPresenter: OpenerViewOutput {

}

extension OpenerPresenter: OpenerInteractorOutput {

}
