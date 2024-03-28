//
//  OpenerInteractor.swift
//  ServicesOpener
//
//  Created by Polina Egorova on 28.03.2024.
//

final class OpenerInteractor {
    
    weak var output: OpenerInteractorOutput?
    
    // MARK: - Private properties
    
    private let appsService: AppsService

    // MARK: - Init

    init(appsService: AppsService) {
        self.appsService = appsService
    }

    // MARK: - Private functions

//    private func initForecast() {
//        Task {
//            guard let data = try await weatherService.getDataFromServer(
//                lat: userLatitude ?? 0,
//                lon: userLongitude ?? 0,
//                requestType: .forecast
//            ) else {
//                output?.setUpForecastParameters(data: nil)
//                return
//            }
//            
//            do {
//                let forecastData = try JSONDecoder().decode(ForecastDataModel.self, from: data)
//                if (Int(forecastData.cod ?? "0") ?? 0) / 100 != 2 {
//                    output?.setUpForecastParameters(data: nil)
//                    return
//                }
//                output?.setUpForecastParameters(data: getForecasts(forecastData))
//            } catch {
//                output?.setUpForecastParameters(data: nil)
//            }
//        }
//    }

}

extension OpenerInteractor: OpenerInteractorInput {

}
