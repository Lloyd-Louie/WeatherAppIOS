//
//  MainWeatherView.swift
//  WeatherApp
//
//  Created by Lloyd Louie Rubio on 12/10/24.
//

import SwiftUI

struct MainWeatherView: View {
    @StateObject private var viewModel = MainWeatherViewModel()

    var body: some View {
        VStack(spacing: 20) {
            Text("Weather App")
                .font(.largeTitle)
                .bold()

            TextField("Enter City", text: $viewModel.cityName, onCommit: {
                viewModel.fetchWeather()
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()

            Text(viewModel.temperature)
                .font(.system(size: 70))
                .bold()

            Text(viewModel.description.capitalized)
                .font(.title3)

            Spacer()
        }
        .padding()
        .onAppear {
            viewModel.fetchWeather()
        }
    }
}
