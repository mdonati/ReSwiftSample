//
//  NextFlightsViewModelType.swift
//  ReSwiftSample
//
//  Created by Mariano Donati on 18/12/17.
//  Copyright © 2017 Mariano Donati. All rights reserved.
//

import Foundation

protocol NextFlightsViewModelType {
    
    var status: Observable<NextFlightsStatus> { get }
    
}

enum NextFlightsStatus {
    
    case none
    case available(viewModels: [FlightBriefViewModelType])
    
}
