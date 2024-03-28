//
//  OpenerInteractor.swift
//  ServicesOpenerWithPinLayout
//
//  Created by Polina Egorova on 28.03.2024.
//

import Foundation
import UIKit

final class OpenerInteractor {
    
    weak var output: OpenerInteractorOutput?
    
    // MARK: - Private properties
    
    private let appsService: AppsService

    // MARK: - Init

    init(appsService: AppsService) {
        self.appsService = appsService
        initAppServices()
    }

    // MARK: - Private functions

    private func initAppServices() {
        Task {
            guard let data = try await appsService.getDataFromServer(url: AppServicesURL.baseURL) else {
                output?.setUpAppServices(services: nil)
                return
            }
            
            do {
                let appSevicesData = try JSONDecoder().decode(AppServicesResponseModel.self, from: data)
                if (appSevicesData.status ?? 0) / 100 != 2 {
                    output?.setUpAppServices(services: nil)
                    return
                }
                
                var appServices = [AppService]()
                for appServiceData in (appSevicesData.body?.services ?? []) {
                    guard var appService = AppService.fromAppServiceDataModel(model: appServiceData) else {
                        output?.setUpAppServices(services: nil)
                        return
                    }
                    guard let imageData = try await appsService.getDataFromServer(url: appServiceData.iconUrl),
                          let image = UIImage(data: imageData) else {
                        output?.setUpAppServices(services: nil)
                        return
                    }
                    appService.icon = image
                    appServices.append(appService)
                }
                
                output?.setUpAppServices(services: appServices)
            } catch {
                output?.setUpAppServices(services: nil)
            }
        }
    }
}

extension OpenerInteractor: OpenerInteractorInput {
    func refreshData() {
        initAppServices()
    }
}
