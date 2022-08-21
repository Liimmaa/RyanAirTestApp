//
//  FlightDetailCell.swift
//  RyanAirApp
//
//  Created by Chioma Amanda Mmegwa  on 18/08/2022.
//

import SwiftUI

struct FlightDetailCell: View {
    var date: Date
    var flightNumber: String
    var regularFee: Double
    
    var body: some View {
        VStack(spacing: 30) {
            HStack() {
                DoubleLineView(name: Constants.date, value: "\(date.dateFormatter())")
                Spacer()
                DoubleLineView(name: Constants.flightNumber, value: "\(flightNumber)")
            }
            DoubleLineView(name: Constants.valueFare, value: regularFee.currencyFormatted())
        }
        .padding()
        .background(Color.white)
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(.regularMaterial, lineWidth: 4)
        )
    }
}
