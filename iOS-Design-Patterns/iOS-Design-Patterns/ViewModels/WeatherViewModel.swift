//
//  WeatherViewModel.swift
//  iOS-Design-Patterns
//
//  Created by Nguyễn Hữu Toàn on 21/11/2022.
//

import Foundation
import CoreLocation

class WeatherViewModel: NSObject {
    
    var bindWeatherModelViewTController: (() -> ()) = {}
    
    private var locationManager = LocationManager()
    
    public var weatherData: WeatherResponse! {
        didSet {
            self.bindWeatherModelViewTController()
        }
    }
    
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMM d, yyyy"
        return formatter
    }()
    
    override init() {
        super.init()
        getLocation()
    }
    
    private func getLocation() {
        locationManager.getActivityLocationManager = {
            let currentLocation = self.locationManager.getCurrentLocation()
            self.getWeather(currentLocation)
        }
    }
    
    private func getWeather(_ currentLocation: CLLocation?) {
        if let currentLocation = currentLocation?.coordinate {
            let urlString = BaseURL.getURLWith(lat: currentLocation.latitude, lon: currentLocation.longitude)
            getWeatherResponse(for: urlString)
        } else {
            let urlString = BaseURL.getURLWith(lat: 21.0224049, lon: 105.81552)
            getWeatherResponse(for: urlString)
        }
    }
    
    private func getWeatherResponse(for urlString: String) {
        API<WeatherResponse>.fetch(with: urlString) { result in 
            switch result {
                case .success(let data):
                    DispatchQueue.main.async {
                        self.weatherData = data
                    }
                case .failure(let err):
                    print(err)
            }
        }    
    }
    
    var windSpeed: String {
        return String(format: "%1.0f", weatherData.wind.speed)
    }
    
    var humidity: String {
        return String(format: "%d", weatherData.main.humidity)
    }
    
    var date: String {
        return dateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(weatherData.dt)))
    }
    
    var temperature: String {
        return getTemp(temp: weatherData.main.temp/10)
    }
    
    func getTemp(temp: Double) -> String {
        return String(format: "%1.0f", temp)
    }
    
}

