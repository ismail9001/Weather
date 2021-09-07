//
//  NetworkService.swift
//  Weather
//
//  Created by Iskander Nizamov on 27.08.2021.
//

import SwiftUI
import Alamofire

final class NetworkService {
    
    static var shared: NetworkService = {
        let instance = NetworkService()
        return instance
    }()

    private init() {}
    
    func getWeatherDataByCity(city: String, completion: @escaping (OneCallResponse) -> Void) {
        let url = Config.shared.baseUrl + "/weather"
        let params: Parameters = [
            "appid": Config.shared.weatherApiKey,
            "q": city,
            "units": "metric",
            "lang": String(Locale.preferredLanguages[0].prefix(2))
        ]
        AF.request(url, method: .get, parameters: params).responseJSON{ response in
            do {
                guard let data = response.data else { return }
                let result = try JSONDecoder().decode(OneCallResponse.self, from: data)
                completion(result)
            } catch {
                print(error)
            }
        }
    }
    
    func getDailyForecast(completion: @escaping (DailyResponse) -> Void) {
        let url = Config.shared.baseUrl + "/forecast/daily"
        let params: Parameters = [
            "appid": Config.shared.weatherApiKey,
            "q": "Kazan",
            "units": "metric",
            "lang": String(Locale.preferredLanguages[0].prefix(2))
        ]
        AF.request(url, method: .get, parameters: params).responseJSON{ response in
            do {
                guard let data = response.data else { return }
                let result = try JSONDecoder().decode(DailyResponse.self, from: data)
                switch result.cod {
                case 200:
                    completion(result)
                case 401:
                    completion(result)
                default:
                    break
                }
                
            } catch {
                print(error)
            }
        }
    }
}
