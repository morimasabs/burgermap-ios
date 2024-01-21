//
//  MapCameraPosition+Sample.swift
//  BurgerMap
//
//  Created by Masahito Mori on 2024/01/08.
//

import SwiftUI
import MapKit

extension MapCameraPosition {
    static let samplePosition = Self.camera(MapCamera(centerCoordinate: .sampleCoordinate, distance: 10000))
}
