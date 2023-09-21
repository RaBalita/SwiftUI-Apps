//
//  OneForecastView.swift
//  PracticeGenius
//
//  Created by Balita on 9/19/23.
//

import SwiftUI

struct OneForecastView: View {
    var data: WeatherForecast
    @StateObject var iconDownloader = WeatherIconDownloader()
    
    var body: some View {
        HStack {
          
            iconDownloader.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
                .foregroundColor(.orange)
                .padding(.leading)
         /*   :
            Image(systemName: "square.and.arrow.up.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
                .foregroundColor(.orange)
                .padding(.leading) */
            Spacer()
            VStack{
                Text(FormatDate(data))
                    .fontWeight(.bold)
                Text(data.weather[0].description)
                    .italic()
            }
            Text("\(Int(data.main.temp))°C") 
                .font(.system(size: 20, weight: .heavy))
                .foregroundColor(.blue)
                .padding()
            
        }.onAppear(){
            let iconName =   data.weather[0].icon
            let path = "https://openweathermap.org/img/wn/\(iconName)@2x.png"
            iconDownloader.getImage(fullPath: path)
        }
       
    }
}
/*
struct OneForecastView_Previews: PreviewProvider {
    static var previews: some View {
        OneForecastView()
    }
}
*/
