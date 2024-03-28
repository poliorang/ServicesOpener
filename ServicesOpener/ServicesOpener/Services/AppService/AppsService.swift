//
//  AppsService.swift
//  ServicesOpener
//
//  Created by Polina Egorova on 28.03.2024.
//

import Foundation

protocol AppsService: AnyObject {
    func getDataFromServer(url: String?) async throws -> Data?
}
