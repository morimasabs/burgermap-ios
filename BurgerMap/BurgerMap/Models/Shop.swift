//
//  Shop.swift
//  BurgerMap
//
//  Created by Masahito Mori on 2024/01/08.
//

import CoreLocation

struct ShopResponse: Decodable {
    var results: Results
}

struct Results: Decodable {
    var shop: [Shop]
}

struct Shop: Identifiable, Decodable {
    var id: String
    var name: String
    var lat: Double
    var lng: Double
}

extension Shop {
    var coordinate: CLLocationCoordinate2D {
        .init(latitude: lat, longitude: lng)
    }
}
