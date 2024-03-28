//
//  AppService.swift
//  ServicesOpener
//
//  Created by Polina Egorova on 28.03.2024.
//

import UIKit

struct AppService {
    let name: String
    let description: String
    let link: String
    var icon: UIImage?
}

extension AppService {
    static func fromAppServiceDataModel(model: AppServiceModel) -> AppService? {
        guard let name = model.name,
              let description = model.description,
              let link = model.link else {
            return nil
        }
        
        return AppService(name: name,
                          description: description,
                          link: link,
                          icon: nil
        )
    }
}
