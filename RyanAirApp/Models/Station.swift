//
//  Station.swift
//  RyanAirApp
//
//  Created by Chioma Amanda Mmegwa  on 16/08/2022.
//

import Foundation

struct GetStationResponse: Codable {
    let stations: [Station]
}

struct Station: Codable {
    var code, name, countryCode, countryName: String
}
