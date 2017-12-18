//
//  FlightsReducer.swift
//  ReSwiftSample
//
//  Created by Mariano Donati on 18/12/17.
//  Copyright © 2017 Mariano Donati. All rights reserved.
//

import Foundation
import ReSwift

func flightsReducer(action: Action, state: FlightsState?) -> FlightsState {
    
    let state = state ?? FlightsState.initial()
    
    switch action {
        
    case AppAction.setFlights(let flights):
        state.allFlights.value = flights
        let flightsChecker = FlightsChecker(flights: flights)
        state.currentFlight.value = flightsChecker.currentFlight
        state.nextFlights.value = flightsChecker.nextFlights
        
    case AppAction.tick:
        let flightsChecker = FlightsChecker(flights: state.allFlights.value)
        state.currentFlight.value = flightsChecker.currentFlight
        state.nextFlights.value = flightsChecker.nextFlights
        
    default:
        break
        
    }
    
    return state
}
