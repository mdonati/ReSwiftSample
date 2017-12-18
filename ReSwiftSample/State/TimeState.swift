//
//  TimeState.swift
//  ReSwiftSample
//
//  Created by Mariano Donati on 18/12/17.
//  Copyright © 2017 Mariano Donati. All rights reserved.
//

import Foundation
import ReSwift

struct TimeState : StateType {
    
    var currentTime: Observable<Date>
    
    static func initial() -> TimeState {
        return TimeState(currentTime: Observable<Date>(Date()))
    }
    
}
