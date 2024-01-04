//
//  MapView.swift
//  BurgerMap
//
//  Created by Masahito Mori on 2024/01/04.
//

import SwiftUI
import MapKit

struct MapView: View {
    private let cameraPosition: MapCameraPosition = MapCameraPosition.camera(MapCamera(centerCoordinate: CLLocationCoordinate2D(latitude: 35.6581, longitude: 139.7017), distance: 2000))
    
    var body: some View {
        Map(initialPosition: cameraPosition)
    }
}

#Preview {
    MapView()
}
