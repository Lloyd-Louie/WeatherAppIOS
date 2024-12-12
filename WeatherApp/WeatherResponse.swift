//
//  WeatherResponse.swift
//  WeatherApp
//
//  Created by Lloyd Louie Rubio on 12/8/24.
//

import Foundation

struct WeatherResponse: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let humidity: Double
    let temp_max: Double
}

struct Weather: Codable {
    let description: String
    let icon: String
}
