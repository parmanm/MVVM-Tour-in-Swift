//
//  WeatherView.swift
//  Weather
//
//  Created by Maxime Parmantier Cloiseau on 16/06/2020.
//  Copyright © 2020 RUN4U Studio. All rights reserved.
//

import UIKit

class WeatherView: UIViewController {
    var cityName: UILabel = UILabel(text: "Bordeaux")
    var currentTime: UILabel = UILabel(text: "14:43")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        view.stack(cityName, currentTime)
    }
}
