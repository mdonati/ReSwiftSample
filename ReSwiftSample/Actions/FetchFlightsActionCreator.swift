//
//  FetchFlightsActionCreator.swift
//  ReSwiftSample
//
//  Created by Mariano Donati on 18/12/17.
//  Copyright © 2017 Mariano Donati. All rights reserved.
//

import Foundation
import ReSwift

func fetchFlights() -> ActionCreator {
    
    return { appState, store in
        
        //This is where we would make a network call to get our flights
        DispatchQueue.global().async {
            //Departure date set to 5 seconds from current time so we can see how current flight is set quickly
            var departureDate = Date().addingTimeInterval(5)
            //Airport codes used to build up our flights
            let airportCodes = ["LA", "BER", "BA", "COL"]
            //Array holding our flights
            var flights = [FlightType]()
            //Build up our flights by specifying departure/arrival date, origin and destination
            for i in 0..<airportCodes.count - 1 {
                let randomDuration = TimeInterval(3600 + arc4random() % 3600) //Between one hour and two
                let arrivalDate = departureDate.addingTimeInterval(randomDuration)
                let origin = airportCodes[i]
                let destination = airportCodes[i+1]
                let flight = Flight(id: UUID().uuidString, flightNumber: "\(origin)\(i+1)", departureDate: departureDate, arrivalDate: arrivalDate, origin: origin, destination: destination)
                flights.append(flight)
                
                departureDate = arrivalDate.addingTimeInterval(1800)
            }
            //Lastly, send the message, our flights have been created!
            DispatchQueue.main.async {
                store.dispatch(AppAction.setFlights(flights: flights))
            }

        }
        
        return nil
    }
    
}
