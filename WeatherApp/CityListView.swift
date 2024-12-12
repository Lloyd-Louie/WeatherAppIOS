//
//  CityListView.swift
//  WeatherApp
//
//  Created by Lloyd Louie Rubio on 12/10/24.
//

import SwiftUI

struct CityListView: View {
    @StateObject private var viewModel = CityWeatherViewModel()

    var filteredCities: [String] {
        if viewModel.searchText.isEmpty {
            return viewModel.cities
        } else {
            return viewModel.cities.filter { $0.localizedCaseInsensitiveContains(viewModel.searchText) }
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                TextField("Search Cities", text: $viewModel.searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                List {
                    ForEach(filteredCities, id: \.self) { city in
                        HStack {
                            Text(city)
                                .font(.headline)
                            Spacer()
                            Text(viewModel.weatherData[city] ?? "--")
                        }
                    }
                }
                .onAppear {
                    viewModel.fetchWeatherForAllCities()
                }
            }
            .navigationTitle("Cities")
        }
    }
}
