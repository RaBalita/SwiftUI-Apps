//
//  APICaller.swift
//  PracticeGenius
//
//  Created by Balita on 9/20/23.
//

import Foundation

class APICaller: ObservableObject {
    @Published var results: [Any] = []
    
    func CallAPI(latitude: Double, longitude: Double){
        let urlString = "https://api.openweathermap.org/data/2.5/forecast?lat=\(latitude)&lon=\(longitude)&lang=fr&units=metric&appid=\(weather_api_key)"
        if let url = URL(string: urlString) {
            print("URL: \(url)")
            URLSession.shared.dataTask(with: url) { data, response, error in
                DispatchQueue.main.async {
                    if let er = error {
                        print("Error: \(er.localizedDescription)")
                        self.results = []
                    }
                    
                    if let dat = data {
                        // Convert data with JsonDecoder
                        do {
                            let result = try JSONDecoder().decode(WeatherAPIResults.self, from: dat)
                            print("Number of elements: \(result.list.count)")
                            self.results = result.list
                        } catch {
                            print("Error during conversion with JsonDecoder")
                            self.results = []
                        }
                    }
                }
            }.resume()
        }
    }
    
    
}
