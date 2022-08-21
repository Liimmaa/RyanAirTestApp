//
//  Flight.swift
//  RyanAirApp
//
//  Created by Chioma Amanda Mmegwa  on 19/08/2022.
//

import Foundation

// This is a mock model
struct GetFlightResponse: Codable {
    let flights: [Flight]
}

struct Flight: Codable {
    let date: Date
    let flightNumber: String
    let regularFee: Double
}

extension Flight {
    public static let example = [Flight(date: Date(),
                                         flightNumber: "AS76TD77",
                                         regularFee: 34574.90),
                                 Flight(date: Date(),
                                         flightNumber: "AS76TD77",
                                         regularFee: 34574.90),
                                 Flight(date: Date(),
                                         flightNumber: "AS76TD77",
                                         regularFee: 34574.90),
                                 Flight(date: Date(),
                                         flightNumber: "AS76TD77",
                                         regularFee: 34574.90),
                                 Flight(date: Date(),
                                         flightNumber: "AS76TD77",
                                         regularFee: 34574.90)]
}
