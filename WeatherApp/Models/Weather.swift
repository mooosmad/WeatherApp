//
//  Weather.swift
//  WeatherApp
//
//  Created by Mo Smad on 21/08/2022.
//

import Foundation


// MARK: - Currentweather
struct Currentweather: Codable{
    let request: Request?
    let location: Location?
    let current: Current?
}

// MARK: - Current
struct Current: Codable{
    let observationTime: String?
    let temperature, weatherCode: Int?
    let weatherIcons: [String]?
    let weatherDescriptions: [String]?
    let windSpeed, windDegree: Int?
    let windDir: String?
    let pressure, precip, humidity, cloudcover: Int?
    let feelslike, uvIndex, visibility: Int?
    let isDay: String?
    var precipt: Int? = 0
}

// MARK: - Location
struct Location: Codable{
    let name, country, region, lat: String?
    let lon, timezoneID, localtime: String?
    let localtimeEpoch: Int?
    let utcOffset: String?
}

// MARK: - Request
struct Request: Codable{
    let type, query, language, unit: String?
}
