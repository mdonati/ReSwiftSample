//
//  CurrentFlightViewModelType.swift
//  ReSwiftSample
//
//  Created by Mariano Donati on 18/12/17.
//  Copyright © 2017 Mariano Donati. All rights reserved.
//

import Foundation

protocol CurrentFlightViewModelType {
    
    var status: Observable<CurrentFlightStatus> { get }
    
}

enum CurrentFlightStatus {
    
    case none
    case available(viewModel: FlightDetailedViewModelType)
    
}
