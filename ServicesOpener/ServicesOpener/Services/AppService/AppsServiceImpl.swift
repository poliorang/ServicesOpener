//
//  AppsServiceImpl.swift
//  ServicesOpenerWithPinLayout
//
//  Created by Polina Egorova on 28.03.2024.
//

import Foundation

final class AppsServiceImpl: AppsService {

    // MARK: - Init

    init() { }
    
    // MARK: - Public functions
    
    public func getDataFromServer(url: String?) async throws -> Data? {
        guard let url = url,
              let request = URL(string: url) else {
            return nil
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: request)
            return data
        } catch {
            return nil
        }
    }
}
