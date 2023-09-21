//
//  WeatherIconDownloader.swift
//  PracticeGenius
//
//  Created by Balita on 9/20/23.
//

import SwiftUI

class WeatherIconDownloader: ObservableObject {
    @Published var image : Image = Image(systemName: "camera.aperture")
    
    func getImage(fullPath: String){
        if let url = URL(string: fullPath){
            URLSession.shared.dataTask(with: url){ d, _, err in
                DispatchQueue.main.async {
                    if let error = err {
                        print(error.localizedDescription)
                    }
                    
                    if let data = d {
                        if let ui = UIImage(data: data){
                            self.image = Image(uiImage: ui)
                        }
                    }
                }
            }.resume()
        } else {
            
        }
    }
}
