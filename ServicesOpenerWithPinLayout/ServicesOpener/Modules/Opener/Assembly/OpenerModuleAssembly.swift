//
//  OpenerModuleAssembly.swift
//  ServicesOpenerWithPinLayout
//
//  Created by Polina Egorova on 28.03.2024.
//

import UIKit

final class OpenerModuleAssembly {

    func module() -> UIViewController {
        
        let appsService = AppsServiceImpl()
        
        let interactor = OpenerInteractor(appsService: appsService)
        
        let presenter = OpenerPresenter(interactor: interactor)
        
        let tableViewDataSource = OpenerTableViewDataSourceImpl()
        
        let controller = OpenerViewController(
            output: presenter,
            tableViewDataSource: tableViewDataSource
        )

        presenter.view = controller
        interactor.output = presenter

        return controller
    }
}
