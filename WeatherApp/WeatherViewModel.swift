//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Lloyd Louie Rubio on 12/8/24.
//

import Foundation

class WeatherViewModel: ObservableObject {
    @Published var cityName: String = ""
    @Published var temperature: String = "--"
    @Published var description: String = "--"
    @Published var humidity: String = "--"
    @Published var weatherIcon: String = ""

    private let apiKey = "bd5e378503939ddaee76f12ad7a97608"

    func fetchWeather(for city: String) async {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)&units=metric") else {
            print("Invalid URL")
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedResponse = try JSONDecoder().decode(WeatherResponse.self, from: data)

            DispatchQueue.main.async {
                self.cityName = decodedResponse.name
                self.temperature = "\(decodedResponse.main.temp)°C"
                self.description = decodedResponse.weather.first?.description.capitalized ?? "--"
                self.humidity = "\(decodedResponse.main.humidity)%"
                self.weatherIcon = decodedResponse.weather.first?.icon ?? ""
            }
        } catch {
            print("Error fetching weather: \(error)")
        }
    }
}
