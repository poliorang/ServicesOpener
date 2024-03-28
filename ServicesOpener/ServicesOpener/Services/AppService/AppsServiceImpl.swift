//
//  AppsServiceImpl.swift
//  ServicesOpener
//
//  Created by Polina Egorova on 28.03.2024.
//

import Foundation

final class AppsServiceImpl: AppsService {

    // MARK: - Private properties
    
    private let url = "https://publicstorage.hb.bizmrg.com/sirius/result.json"
    
    // MARK: - Init

    init() { }
    
    // MARK: - Public functions
    
    public func getDataFromServer() async throws -> Data? {
        let url = URL(string: url)!

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return data
        } catch {
            return nil
        }
    }
}
