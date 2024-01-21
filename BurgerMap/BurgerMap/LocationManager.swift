//
//  LocationManager.swift
//  BurgerMap
//
//  Created by Masahito Mori on 2024/01/08.
//

import CoreLocation
import SwiftUI
import MapKit

final class LocationManager: NSObject, ObservableObject {
    static let shared = LocationManager()
    private let locationManager = CLLocationManager()
    
    private(set) var currentCoordinate: CLLocationCoordinate2D = .sampleCoordinate
    @Published private(set) var authorizationStatus: CLAuthorizationStatus = .notDetermined
    @Published var cameraPosition: MapCameraPosition = .samplePosition
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        // 5m移動したら、位置情報を通知
        locationManager.distanceFilter = 5.0
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        authorizationStatus = manager.authorizationStatus
        switch manager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
        default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        currentCoordinate = location.coordinate
        cameraPosition = MapCameraPosition.camera(MapCamera(centerCoordinate: currentCoordinate, distance: 10000))
    }
}
