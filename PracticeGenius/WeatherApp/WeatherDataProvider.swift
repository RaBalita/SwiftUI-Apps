//
//  WeatherDataProvider.swift
//  PracticeGenius
//
//  Created by Balita on 9/19/23.
//

import Foundation

struct WeatherAPIResults: Decodable {
    var list : [WeatherForecast]
}

struct WeatherForecast: Decodable {
    var dt: Int
    var main: Main
    var weather: [Weather]
    var clouds: Clouds
    var wind: Wind
    var visibility: Int
    var dt_txt: String
}

struct Main: Decodable {
    var temp: Double
    var feels_like: Double
    var temp_min : Double
    var temp_max: Double
    var pressure: Double
    var sea_level: Double
    var grnd_level: Double
    var humidity: Int
    var temp_kf: Double
}

struct Weather: Decodable {
    var id: Int
    var main: String
    var description: String
    var icon: String
}

struct Clouds: Decodable {
    var all: Int
}

struct Wind: Decodable {
    var speed: Double
    var deg: Int
    var gust: Double
}

func ConvertStringToDate(dateToConvert: String) -> Date {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "YYYY-MM-dd HH:mm:ss"
    return dateFormatter.date(from: dateToConvert) ?? Date()
}

func FormatDateForThisApp(dateToFormat: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .medium
    dateFormatter.timeStyle = .short
    dateFormatter.locale = Locale(identifier: "fr-FR")
        /* let timeFormatter = DateFormatter()
    timeFormatter.dateStyle = .none
    timeFormatter.timeStyle = .short
    timeFormatter.locale = Locale(identifier: "fr-FR")
    let days = dateFormatter.string(from: dateToFormat)
    let hours = timeFormatter.string(from: dateToFormat)
    return "\(days) à \(hours)"*/
    return dateFormatter.string(from: dateToFormat)
}

func FormatDate(_ data: WeatherForecast) -> String{
    let tempo = ConvertStringToDate(dateToConvert: data.dt_txt)
    let result = FormatDateForThisApp(dateToFormat: tempo)
    return result
}
