//
//  ContentView.swift
//  RyanAirApp
//
//  Created by Chioma Amanda Mmegwa  on 16/08/2022.
//

import SwiftUI

struct SearchFlightsView: View {
    @ObservedObject var viewModel: SearchFlightsViewModel
    
    init(viewModel: SearchFlightsViewModel) {
        self.viewModel = viewModel
        UITableView.appearance().backgroundColor = .white
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                VStack {
                    Form {
                        stationPickerView(pickerSelection: $viewModel.departureStation, title: Constants.origin)
                        
                        stationPickerView(pickerSelection: $viewModel.destinationStation, title: Constants.destination)
                        
                        DatePicker(
                            selection: $viewModel.departureDate,
                            in: Date()...,
                            displayedComponents: [.date]
                        ) {
                            Text(Constants.travelDate)
                        }
                        .padding()
                        
                        Stepper("\(Constants.adult): \(viewModel.adult)", value: $viewModel.adult, in: 1...6)
                            .padding()
                        Stepper("\(Constants.teen): \(viewModel.teen)", value: $viewModel.teen, in: 0...6)
                            .padding()
                        Stepper("\(Constants.children): \(viewModel.children)", value: $viewModel.children, in: 0...6)
                            .padding()
                    }
                    .frame(height: geo.size.height * 0.75)
                    
                    searchFlightsButton
                }
                .navigationTitle(Constants.searchFlight)
                .onAppear() {
                    viewModel.getAvailableStations()
                }
                .alert(item: $viewModel.showAlert) { alert in
                    Alert(title: Text(alert.title), message: Text(alert.message))
                }
            }
        }
    }
    
    var searchFlightsButton: some View {
        NavigationLink(
            destination: FlightsView(viewModel: FlightsViewModel(flights: viewModel.flights)),
            isActive: $viewModel.showRoutes
        ) {
            Button(action: {
                viewModel.handleFetchFlights()
            }) {
                Text(Constants.searchFlight)
                    .foregroundColor(.white)
                    .padding(10)
                    .background(
                        Rectangle()
                            .cornerRadius(10)
                    )
            }
        }
        .padding()
    }
    
    func stationPickerView(pickerSelection: Binding<String>, title: String) -> some View {
        Picker(selection: pickerSelection, label: Text(title)){                        StationsSearchBar(text: $viewModel.searchText)
            ForEach(viewModel.stations, id: \.code) { station in
                Text(station.name)
            }
            .resignKeyboardOnDragGesture()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SearchFlightsView(viewModel: SearchFlightsViewModel())
    }
}
