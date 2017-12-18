//
//  FlightsChecker.swift
//  ReSwiftSample
//
//  Created by Mariano Donati on 18/12/17.
//  Copyright © 2017 Mariano Donati. All rights reserved.
//

import Foundation

struct FlightsChecker {
    
    let currentFlight: FlightType?
    let nextFlights: [FlightType]
    
    init(flights: [FlightType]) {
        
        let flights = flights.sorted { a, b in
            return a.departureDate <= b.departureDate
        }
        
        let now = Date()
        var currentFlight: FlightType?
        var nextFlights = [FlightType]()
        for flight in flights {
            if now >= flight.departureDate {
                if now <= flight.arrivalDate {
                    currentFlight = flight
                }
            } else {
                nextFlights.append(flight)
            }
        }
        
        self.currentFlight = currentFlight
        self.nextFlights = nextFlights
    }
    
}
