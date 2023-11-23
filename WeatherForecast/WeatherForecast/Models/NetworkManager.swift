//
//  NetworkManager.swift
//  WeatherForecast
//
//  Created by 김진웅 on 11/20/23.
//

import Foundation

final class NetworkManager {
    
    func fetchWeather<T: Decodable>(weatherType: ForecastType,
                                    latitude: Double,
                                    longitude: Double,
                                    completion: @escaping (Result<T, Error>)-> Void) {
        
        guard let url = weatherType.makeURL(lon: longitude, lat: latitude)
        else {
            completion(.failure(NetworkError.invalidURLError))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(NetworkError.unknownError(error)))
            }
            
            guard let response = response as? HTTPURLResponse else { return }
            guard (200 ..< 299) ~= response.statusCode else {
                completion(.failure(NetworkError.responseError(statusCode: response.statusCode)))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.noDataError))
                return
            }
            
            do {
                let weather = try JSONDecoder().decode(T.self, from: data)
                completion(.success(weather))
            } catch {
                completion(.failure(NetworkError.decodingError))
            }
        }.resume()
    }
}
