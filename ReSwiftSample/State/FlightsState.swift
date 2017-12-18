//
//  FlightsState.swift
//  ReSwiftSample
//
//  Created by Mariano Donati on 18/12/17.
//  Copyright © 2017 Mariano Donati. All rights reserved.
//

import Foundation
import ReSwift

struct FlightsState : StateType {
    
    let currentFlight: Observable<FlightType?>
    let nextFlights: Observable<[FlightType]>
    let allFlights: Observable<[FlightType]>
    
    static func initial() -> FlightsState {
        return FlightsState(currentFlight: Observable<FlightType?>(nil), nextFlights: Observable<[FlightType]>([]), allFlights: Observable<[FlightType]>([]))
    }
    
}
