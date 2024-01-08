//
//  MapCameraPosition+Sample.swift
//  BurgerMap
//
//  Created by Masahito Mori on 2024/01/08.
//

import SwiftUI
import MapKit

extension MapCameraPosition {
    static let samplePosition = MapCameraPosition.camera(MapCamera(centerCoordinate: CLLocationCoordinate2D(latitude: 35.6581, longitude: 139.7017), distance: 2000))
}
