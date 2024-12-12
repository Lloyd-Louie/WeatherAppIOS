//
//  CityWeatherViewModel.swift
//  WeatherApp
//
//  Created by Lloyd Louie Rubio on 12/10/24.
//

import Foundation

class CityWeatherViewModel: ObservableObject {
    @Published var cities: [String] = ["New York", "London", "Tokyo", "Paris"]
    @Published var searchText: String = ""
    @Published var weatherData: [String: String] = [:]

    private let apiKey = "bd5e378503939ddaee76f12ad7a97608"

    func fetchWeather(for city: String) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)&units=metric") else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }

            do {
                let weatherResponse = try JSONDecoder().decode(WeatherResponse.self, from: data)
                DispatchQueue.main.async {
                    self.weatherData[city] = "\(Int(weatherResponse.main.temp))°C"
                }
            } catch {
                print("Error decoding weather data: \(error)")
            }
        }.resume()
    }

    func fetchWeatherForAllCities() {
        for city in cities {
            fetchWeather(for: city)
        }
    }
}
