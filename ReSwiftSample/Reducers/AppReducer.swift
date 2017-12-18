//
//  AppReducer.swift
//  ReSwiftSample
//
//  Created by Mariano Donati on 18/12/17.
//  Copyright © 2017 Mariano Donati. All rights reserved.
//

import Foundation
import ReSwift

func appReducer(action: Action, state: AppState?) -> AppState {
    return AppState(
        flightsState: flightsReducer(action: action, state: state?.flightsState),
        timeState: timeReducer(action: action, state: state?.timeState)
    )
}
