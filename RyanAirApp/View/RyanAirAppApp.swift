//
//  RyanAirAppApp.swift
//  RyanAirApp
//
//  Created by Chioma Amanda Mmegwa  on 16/08/2022.
//

import SwiftUI

@main
struct RyanAirAppApp: App {
    var body: some Scene {
        WindowGroup {
            SearchFlightsView(viewModel: SearchFlightsViewModel())
        }
    }
}
