//
//  RPLocationService.swift
//  ReparaPC
//
//  Created by Javier Cervantes on 29/06/18.
//  Copyright © 2018 Oscod. All rights reserved.
//

import UIKit
import CoreLocation

protocol UpdateUserLocationDelegate {
    func userLocationWasUpdated(_ location: CLLocation?)
}

class RPLocationService: NSObject, CLLocationManagerDelegate {

    var locationManager = CLLocationManager()
    var locationDelegate: UpdateUserLocationDelegate?
    var location: CLLocation?
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
    }
    
    func enableLocationManager() {
        
        if CLLocationManager.locationServicesEnabled() {
            switch(CLLocationManager.authorizationStatus()) {
            case .notDetermined, .restricted, .denied:
                print("No access")
                locationManager.requestWhenInUseAuthorization()
            case .authorizedAlways, .authorizedWhenInUse:
                print("Access")
            }
        } else {
            print("Location services are not enabled")
        }
        locationManager.startUpdatingLocation()
    }
    
    func disableLocationManager() {
        locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations[locations.count - 1]
        print("coord: \(String(describing: location?.coordinate.latitude)) \(String(describing: location?.coordinate.longitude))")
        locationDelegate?.userLocationWasUpdated(location)
        
        disableLocationManager()
    }
    
    func isLocationEnable() -> Bool {
        if CLLocationManager.locationServicesEnabled() {
            switch(CLLocationManager.authorizationStatus()) {
            case .notDetermined, .restricted, .denied:
                print("No access")
                return false
            case .authorizedAlways, .authorizedWhenInUse:
                print("Access")
                return true
            }
        } else {
            print("Location services are not enabled")
            return false
        }
        
    }
}
