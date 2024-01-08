//
//  LocationManager.swift
//  BurgerMap
//
//  Created by Masahito Mori on 2024/01/08.
//

import CoreLocation

final class LocationManager: NSObject {
    private let locationManager = CLLocationManager()
    // 現在地
    private(set) var currentCoordinate: CLLocationCoordinate2D = .sampleCoordinate
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        // 5m移動したら、位置情報を通知
        locationManager.distanceFilter = 5.0
    }
    
    // 現在地を取得する
    func getCurrentLocation() -> CLLocationCoordinate2D { currentCoordinate }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
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
    }
}
