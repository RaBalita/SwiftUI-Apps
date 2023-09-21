//
//  OneClosestForecastView.swift
//  PracticeGenius
//
//  Created by Balita on 9/20/23.
//

import SwiftUI

struct OneClosestForecastView: View {
     var data: WeatherForecast
    @StateObject var iconDownloader = WeatherIconDownloader()
    
    var body: some View {
        VStack{
            HStack {
              
                iconDownloader.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .foregroundColor(.orange)
           /*     :
                Image(systemName: "square.and.arrow.up.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .foregroundColor(.orange) */
                Spacer()
                Text("\(Int(data.main.temp))°C")  // 

                    .font(.system(size: 30, weight: .heavy))
                    .foregroundColor(.orange)
            }.padding(EdgeInsets(top: 30, leading:40, bottom: 20, trailing: 20))
            Text(FormatDate(data))
                .font(.title3)
                .fontWeight(.bold)
            Text(data.weather[0].description)
                .font(.title3)
                .italic()
                .padding(.bottom)
            
            
        }.onAppear(){
            let iconName =   data.weather[0].icon
            let path = "https://openweathermap.org/img/wn/\(iconName)@2x.png"
            iconDownloader.getImage(fullPath: path)
        }
        .background {
            RoundedRectangle(cornerRadius: 20)
                .fill(.mint.opacity(0.4))
        }.padding(10)
    }
}


