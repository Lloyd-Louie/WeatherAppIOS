//
//  MainWeatherViewModel.swift
//  WeatherApp
//
//  Created by Lloyd Louie Rubio on 12/10/24.
//

import Foundation

class MainWeatherViewModel: ObservableObject {
    @Published var cityName: String = "San Francisco"
    @Published var temperature: String = "--"
    @Published var description: String = "--"
    @Published var icon: String = ""


    private let apiKey = "bd5e378503939ddaee76f12ad7a97608"

    func fetchWeather() {
          guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=\(apiKey)&units=metric") else { return }

          URLSession.shared.dataTask(with: url) { data, response, error in
              guard let data = data, error == nil else { return }

              do {
                  let weatherResponse = try JSONDecoder().decode(WeatherResponse.self, from: data)
                  DispatchQueue.main.async {
                      self.temperature = "\(Int(weatherResponse.main.temp))°C"
                      self.description = weatherResponse.weather.first?.description ?? ""
                      self.icon = weatherResponse.weather.first?.icon ?? ""
                  }
              } catch {
                  print("Error decoding weather data: \(error)")
              }
          }.resume()
      }
}
