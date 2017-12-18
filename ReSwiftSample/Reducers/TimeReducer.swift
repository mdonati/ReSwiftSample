//
//  TimeReducer.swift
//  ReSwiftSample
//
//  Created by Mariano Donati on 18/12/17.
//  Copyright © 2017 Mariano Donati. All rights reserved.
//

import Foundation
import ReSwift

func timeReducer(action: Action, state: TimeState?) -> TimeState {
    
    let state = state ?? TimeState.initial()
    
    switch action {
        
    case AppAction.tick:
        state.currentTime.value = Date()
        
    default:
        break
        
    }
    
    return state
}
