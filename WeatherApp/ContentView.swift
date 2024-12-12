//
//  ContentView.swift
//  WeatherApp
//
//  Created by Lloyd Louie Rubio on 12/8/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MainWeatherView()
                .tabItem {
                    Label("Main", systemImage: "cloud.sun")
                }

            CityListView()
                .tabItem {
                    Label("Cities", systemImage: "magnifyingglass")
                }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
