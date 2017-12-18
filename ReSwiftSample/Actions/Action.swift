//
//  Action.swift
//  ReSwiftSample
//
//  Created by Mariano Donati on 18/12/17.
//  Copyright © 2017 Mariano Donati. All rights reserved.
//

import Foundation
import ReSwift

enum AppAction : Action {
    
    case tick
    case setFlights(flights: [FlightType])
    
}

typealias ActionCreator = (_ state: AppState, _ store: Store<AppState>) -> Action?
