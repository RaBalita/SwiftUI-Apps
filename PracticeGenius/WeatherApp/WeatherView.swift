//
//  WeatherView.swift
//  PracticeGenius
//
//  Created by Balita on 9/21/23.
//

import SwiftUI

struct WeatherView: View {
    
    @ObservedObject var place: MapDataProvider  = MapDataProvider()
    @StateObject var api: APICaller = APICaller()
    
    var body: some View{
        
        NavigationStack {
            
            if (api.results.count == 0) {
                Text("Waiting for the results !!")
            } else {
                OneClosestForecastView(data: api.results[0] as! WeatherForecast)
            }
            Spacer()
            
            ScrollView {
                if (api.results.count > 1) {
                    ForEach(1..<$api.results.count, id: \.self) { id in
                        
                        OneForecastView(data: api.results[id] as! WeatherForecast)
                    }
                }
                
            }
            .navigationTitle(place.locality)
            .navigationBarTitleDisplayMode(.inline)
            
            
        }.onAppear {
            place.CheckLocation()
        }.onChange(of: place.locality) { newValue in
            api.CallAPI(latitude: place.location[0], longitude: place.location[1])
        }
        
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
