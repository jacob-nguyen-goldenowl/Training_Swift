//
//  WeatherViewController.swift
//  iOS-Design-Patterns
//
//  Created by Nguyễn Hữu Toàn on 21/11/2022.
//

import UIKit

class WeatherViewController: UIViewController {

    private var weatherViewModel: WeatherViewModel!
    
    private let backgroundWeather: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var weatherLabel = customLabel(font: UIFont(name: "Thonburi", size: 25)!)
    private lazy var dateLabel = customLabel(font: UIFont(name: "Thonburi-Light", size: 15)!)
    private lazy var temperatureLabel = customLabel(font: UIFont(name: "Thonburi-Bold", size: 100)!)
    
    private let containerView = UIView()
    private let mainView = UIView()
    
    private lazy var weatherImage: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        callToViewModelForUIUpdate()
        setupViews()
    }
    
    private func setupViews() {
        view.addSubview(backgroundWeather)
        setupConstraintViews()
        setupContainerView()
        setupMainView()
        setupSubViewInMainView()
    }
    
    private func setupConstraintViews() {
        backgroundWeather.addSubview(weatherLabel)
        backgroundWeather.addSubview(dateLabel)
        
        backgroundWeather.anchor(top: view.topAnchor,
                                 bottom: view.bottomAnchor,
                                 leading: view.leadingAnchor,
                                 trailing: view.trailingAnchor)
        
        weatherLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                            leading: view.leadingAnchor,
                            trailing: view.trailingAnchor,
                            paddingTop: 50,
                            paddingLeading: 10,
                            paddingTrailing: 10)
        weatherLabel.setHeight(height: 40)
        
        dateLabel.anchor(top: weatherLabel.bottomAnchor,
                         leading: view.leadingAnchor,
                         trailing: view.trailingAnchor,
                         paddingTop: 5,
                         paddingLeading: 10,
                         paddingTrailing: 10)
        dateLabel.setHeight(height: 20)
        
    }
    
    private func setupContainerView() {
        backgroundWeather.addSubview(containerView)
        containerView.anchor(bottom: backgroundWeather.bottomAnchor,
                             leading: backgroundWeather.leadingAnchor,
                             trailing: backgroundWeather.trailingAnchor)
        containerView.setHeight(height: 350)
        containerView.backgroundColor = UIColor.white
        containerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        containerView.layer.cornerRadius = 30
    }
    
    private func setupMainView() {
        backgroundWeather.addSubview(mainView)
        mainView.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        mainView.anchor(top: dateLabel.bottomAnchor,
                        bottom: containerView.topAnchor,
                        leading: backgroundWeather.leadingAnchor,
                        trailing: backgroundWeather.trailingAnchor,
                        paddingTop: 20,
                        paddingBottom: 50,
                        paddingLeading: 10,
                        paddingTrailing: 10)
        mainView.layer.cornerRadius = 30
    }
    
    private func setupSubViewInMainView() {
        mainView.addSubview(temperatureLabel)
        temperatureLabel.anchor(top: mainView.topAnchor,
                                leading: mainView.leadingAnchor,
                                trailing: mainView.trailingAnchor,
                                paddingTop: 5,
                                paddingLeading: 10,
                                paddingTrailing: 10)
        temperatureLabel.setHeight(height: 100)
    }
    
    private func callToViewModelForUIUpdate() {
        self.weatherViewModel = WeatherViewModel()
        self.weatherViewModel.bindWeatherModelViewTController  = {
            DispatchQueue.main.async {
                self.weatherLabel.text = self.weatherViewModel.weatherData.name
                self.dateLabel.text = self.weatherViewModel.date
                self.temperatureLabel.text = "\(self.weatherViewModel.temperature)º"
            }
        }
    }
    
    private func customLabel(font: UIFont) -> UILabel {
        let label = UILabel()
        label.font = font
        label.textColor = UIColor.white
        label.textAlignment = .center
        return label
    }

}
