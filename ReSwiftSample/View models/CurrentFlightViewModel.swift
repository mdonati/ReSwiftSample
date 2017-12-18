//
//  CurrentFlightViewModel.swift
//  ReSwiftSample
//
//  Created by Mariano Donati on 18/12/17.
//  Copyright © 2017 Mariano Donati. All rights reserved.
//

import Foundation

struct CurrentFlightViewModel : CurrentFlightViewModelType {
    
    private(set) var status: Observable<CurrentFlightStatus>
    
    init(status: CurrentFlightStatus) {
        self.status = Observable<CurrentFlightStatus>(status)
    }
    
}
