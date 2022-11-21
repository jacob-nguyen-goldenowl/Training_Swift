//
//  LocationManager.swift
//  iOS-Design-Patterns
//
//  Created by Nguyễn Hữu Toàn on 21/11/2022.
//

import Foundation

import UIKit 
import CoreLocation

typealias LocationCompletion = (CLLocation) -> ()

class LocationManager: NSObject {
    
    private let locationManager = CLLocationManager()
    private var currentLocationCompletion: LocationCompletion?
    private var locationCompletion: LocationCompletion?
    private var isUpdatingLocation = false
    
    var getActivityLocationManager: (() -> ()) = {}
    
    private var currentLocation: CLLocation? {
        didSet {
            getActivityLocationManager()
        }
    }
    
    override init() {
        super.init()
        self.configureLocation()
    }
    
    func configureLocation() {
        locationManager.delegate = self
        locationManager.allowsBackgroundLocationUpdates = true
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 10
    }
    
    func getAuthorizationStatus() -> CLAuthorizationStatus {
        return locationManager.authorizationStatus
    }
    
    func request() {
        let status = getAuthorizationStatus()
        DispatchQueue.global(qos: .background).async {
            if status == .denied || status == .restricted || !CLLocationManager.locationServicesEnabled() {
                return
            }
            if status == .notDetermined {
                self.locationManager.requestWhenInUseAuthorization()
            }
        }
        locationManager.requestLocation()
    }
    
    func getCurrentLocation() -> CLLocation? {
        let status = getAuthorizationStatus()
        DispatchQueue.global(qos: .background).async {
            if status == .denied || status == .restricted || !CLLocationManager.locationServicesEnabled() {
                self.showAlertGoToSetting()
            }
        }
        return currentLocation
    }
    
    func showAlertGoToSetting() {
        let keyWindow = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .map({$0 as? UIWindowScene})
            .compactMap({$0})
            .first?.windows
            .filter({$0.isKeyWindow}).first
        if var topController = keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            let message = "Turn on your location settings in Weather Find"
            let alertController = UIAlertController (title: "", message: message, preferredStyle: .alert)
            let settingsAction = UIAlertAction(title: "Go to settings", style: .default) { (_) -> Void in
                
                guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                    return
                }
                
                if UIApplication.shared.canOpenURL(settingsUrl) {
                    UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                        print("Settings opened: \(success)") // Prints true
                    })
                }
            }
            alertController.addAction(settingsAction)
            let cancelAction = UIAlertAction(title: "No thanks", style: .default, handler: nil)
            alertController.addAction(cancelAction)
            
            topController.present(alertController, animated: true, completion: nil)
        }
    }
    
}

extension LocationManager: CLLocationManagerDelegate {
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        let status = manager.authorizationStatus
        switch status {
            case .authorizedAlways: 
                print("user allow app to get location data when app is active or in background.")
                manager.requestLocation()
            case .authorizedWhenInUse:
                print("user allow app to get location data only when app is active.")
                manager.requestLocation()
            case .denied:
                print("user tap 'disallow' on the permission dialog, can not get location data.")
            case .restricted: 
                print("parental control setting disallow location data.")
            case .notDetermined:
                print("the location permission dialog haven't shown before, user haven't tap allow/disallow.")
            default: 
                print("default.")
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            self.currentLocation = location
            print(location.coordinate.longitude)
            print(location.coordinate.latitude)
            
            if let currentCompletion = currentLocationCompletion {
                currentCompletion(location)
                print(currentCompletion)
            }
            
            if isUpdatingLocation, let updating = locationCompletion {
                updating(location)
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error: \(error.localizedDescription)")
    }
    
}


