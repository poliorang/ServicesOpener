//
//  AppServiceModel.swift
//  ServicesOpener
//
//  Created by Polina Egorova on 28.03.2024.
//

import Foundation

struct AppServiceModel: Codable {
    var name: String?
    var description: String?
    var link: String?
    var iconURL: String?
}

struct AppServiceResponse: Codable {
    var services: [AppServiceModel]
}
