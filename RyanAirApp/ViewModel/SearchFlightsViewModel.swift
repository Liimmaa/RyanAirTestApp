//
//  RyanAirViewModel.swift
//  RyanAirApp
//
//  Created by Chioma Amanda Mmegwa  on 17/08/2022.
//

import Foundation

final class SearchFlightsViewModel: ObservableObject {
    @Published var stations = [Station]()
    @Published var flights = [Flight]()
    @Published var departureStation = String()
    @Published var destinationStation = String()
    @Published var departureDate = Date()
    @Published var adult = 1
    @Published var teen = 0
    @Published var children = 0
    @Published var showRoutes = false
    @Published var showAlert: MessagePrompt?
    @Published var searchText = "" {
        didSet {
            if searchText != "" {
                self.stations = stations.filter{$0.name.hasPrefix(searchText) || $0.code.hasPrefix(searchText.uppercased())}
            } else {
                getAvailableStations()
            }
        }
    }
    
    func getAvailableStations() {
        NetWorkEngine.request(endpoint: RyanAirEndpoint.getAvailableStations) { (result: Result<GetStationResponse, Error>) in
            switch result {
            case .success(let response):
                self.stations = response.stations
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchAvailableFlights() {
        // Allows for navigation due to the use of mock API
        self.showRoutes = true
        
        NetWorkEngine.request(endpoint: RyanAirEndpoint.getFlights(origin: self.departureStation, destination: self.destinationStation, dateout: self.departureDate.dateFormatter(), adt: self.adult, teen: self.teen, chd: self.children)) { (result: Result<GetFlightResponse, Error>) in
            switch result {
            case .success(let response):
                self.flights = response.flights
                // Gets assigned when API is available
                // self.showDetails = true
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func handleFetchFlights() {
        if departureStation.isEmpty {
            let alert = MessagePrompt(title: Constants.departureAlertTitle, message: Constants.departureAlertMessage)
            showAlert = alert
            return
        } else if destinationStation.isEmpty {
            let alert = MessagePrompt(title: Constants.destinationAlertTitle, message: Constants.destinationAlertMessage)
            showAlert = alert
            return
        } else {
            fetchAvailableFlights()
        }
    }
}
