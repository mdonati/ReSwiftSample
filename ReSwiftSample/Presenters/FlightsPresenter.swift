//
//  FlightsPresenter.swift
//  ReSwiftSample
//
//  Created by Mariano Donati on 18/12/17.
//  Copyright © 2017 Mariano Donati. All rights reserved.
//

import Foundation

/// A presenters that binds flights state to current flight and next flights view models
class FlightsPresenter {
    
    private let flightsState: FlightsState
    
    deinit {
        self.flightsState.currentFlight.unsubscribe(self)
        self.flightsState.nextFlights.unsubscribe(self)
    }
    
    init(flightsState: FlightsState) {
        self.flightsState = flightsState
        
        self.flightsState.currentFlight.subscribe(self) { [weak self] old, new in
            self?.setCurrentFlight(flight: new)
        }
        
        self.flightsState.nextFlights.subscribe(self) { [weak self] old, new in
            self?.setNextFlights(flights: new)
        }
        
    }
    
    lazy var currentFlightViewModel: CurrentFlightViewModelType = {
       return CurrentFlightViewModel(status: .none)
    }()
    
    lazy var nextFlightsViewModel: NextFlightsViewModelType = {
       return NextFlightsViewModel(status: .none)
    }()
    
    private func setCurrentFlight(flight: FlightType?) {
        if let currentFlight = flight {
            self.currentFlightViewModel.status.value = .available(viewModel: self.flightDetailedViewModel(flight: currentFlight))
        } else {
            self.currentFlightViewModel.status.value = .none
        }
    }
    
    private func setNextFlights(flights: [FlightType]) {
        if flights.count > 0 {
            self.nextFlightsViewModel.status.value = .available(viewModels: flights.map { self.flightBriefViewModel(flight: $0)})
        } else {
            self.nextFlightsViewModel.status.value = .none
        }
    }
    
    private func flightDetailedViewModel(flight: FlightType) -> FlightDetailedViewModelType {
        let description = "\(flight.flightNumber) \(flight.origin)-\(flight.destination)"
        let departureDate = self.formatDate(date: flight.departureDate)
        let arrivalDate = self.formatDate(date: flight.arrivalDate)
        return FlightDetailedViewModel(description: description, departureDate: departureDate, arrivalDate: arrivalDate)
    }
    
    private func flightBriefViewModel(flight: FlightType) -> FlightBriefViewModelType {
        let description = "\(flight.origin)-\(flight.destination)"
        let departureDate = self.formatDate(date: flight.departureDate)
        return FlightBriefViewModel(description: description, departureDate: departureDate)
    }
    
    private func formatDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
    
}
