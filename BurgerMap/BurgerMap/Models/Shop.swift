//
//  Shop.swift
//  BurgerMap
//
//  Created by Masahito Mori on 2024/01/08.
//

import CoreLocation

struct Shop: Identifiable {
    var id: Int
    var name: String
    var lat: Double
    var lon: Double
}

extension Shop {
    var coordinate: CLLocationCoordinate2D {
        .init(latitude: lat, longitude: lon)
    }
}
