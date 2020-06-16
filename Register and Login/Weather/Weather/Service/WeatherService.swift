//
//  WeatherService.swift
//  Weather
//
//  Created by Maxime Parmantier Cloiseau on 16/06/2020.
//  Copyright © 2020 RUN4U Studio. All rights reserved.
//

import Foundation

class WeatherService {
    private let base_url: String = "api.openweathermap.org/data/2.5"
    private let api_key: String = "&appid=2890bf233acdb7ffb9d5834315e98fd8"
    private var client: HttpClient
    
    init() {
        client = HttpClient(base_url: base_url)
    }
    
    func getCurrentFor(city: String) {
        let path = "\(base_url)/weather?q=\(city)\(api_key)"
        
        client.GET(path) { (res) in
            do {
                let weather = try JSONDecoder().decode(CurrentLocalWeather.self, from: res.get())
                print(weather.main.temp)
            } catch let jsonError {
                print(jsonError)
            }
        }
    }
}
