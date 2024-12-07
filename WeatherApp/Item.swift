//
//  Item.swift
//  WeatherApp
//
//  Created by Lloyd Louie Rubio on 12/8/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
