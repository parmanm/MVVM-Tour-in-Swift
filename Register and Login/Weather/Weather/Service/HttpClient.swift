//
//  HttpClient.swift
//  Weather
//
//  Created by Maxime Parmantier Cloiseau on 16/06/2020.
//  Copyright © 2020 RUN4U Studio. All rights reserved.
//

import Foundation

class HttpClient {
    let base_url: String
    let session: URLSession
    
    //GET method for api
    func GET(_ path: String, _ completion: @escaping (Result<Data, Error>) -> ()) {
        if Checker.isConnectedToInternet() {
            guard let url = URL(string: "\(base_url)\(path)") else {
                return
            }
            
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            
            session.dataTask(with: request, completionHandler: { data, response, error in
                if error != nil {
                    completion(.failure(error!))
                    return
                } else {
                    completion(.success(data!))
                }
            }).resume()
        }
    }
    
    //GET method for api
    func POST(_ path: String, jsonData: Data?, _ completion: @escaping (Result<Data, Error>) -> ()) {
        if Checker.isConnectedToInternet() {
            guard let url = URL(string: "\(base_url)\(path)") else {
                return
            }
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")

            // insert json data to the request
            if jsonData != nil {
                request.httpBody = jsonData
            }
            
            session.dataTask(with: request, completionHandler: { data, response, error in
                    if error != nil {
                        completion(.failure(error!))
                        return
                    } else {
                        completion(.success(data!))
                    }
                }).resume()
        }
    }
    
    init(base_url: String) {
        self.base_url = base_url
        self.session = URLSession.shared
    }
}
