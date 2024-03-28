//
//  AppServiceModel.swift
//  ServicesOpenerWithPinLayout
//
//  Created by Polina Egorova on 28.03.2024.
//

import Foundation

struct AppServiceModel: Decodable {
    let name: String?
    let description: String?
    let link: String?
    let iconUrl: String?
    
    private enum CodingKeys: String, CodingKey {
        case name
        case description
        case link
        case iconUrl = "icon_url"
    }
}

struct AppServicesModel: Decodable {
    let services: [AppServiceModel]?
}

struct AppServicesResponseModel: Decodable {
    let body: AppServicesModel?
    let status: Int?
}
