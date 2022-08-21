//
//  RyanAirFlightsViewModel.swift
//  RyanAirApp
//
//  Created by Chioma Amanda Mmegwa  on 20/08/2022.
//

import Foundation

final class FlightsViewModel: ObservableObject {
    @Published var flights: [Flight]
    
    init(
        flights: [Flight]
    ) {
        self.flights = flights
    }
}
