//
//  RyanAirDetailView.swift
//  RyanAirApp
//
//  Created by Chioma Amanda Mmegwa  on 18/08/2022.
//

import SwiftUI

struct FlightsView: View {
    @ObservedObject var viewModel: FlightsViewModel
    
    var body: some View {
        List {
            ForEach(Flight.example, id: \.date) { flight in                FlightDetailCell(date: Date(), flightNumber: flight.flightNumber, regularFee: flight.regularFee)
                    .listRowSeparator(.hidden)
            }
        }
    }
    
}
