//
//  IFlight.swift
//  ReSwiftSample
//
//  Created by Mariano Donati on 18/12/17.
//  Copyright © 2017 Mariano Donati. All rights reserved.
//

import Foundation

protocol FlightType {
    
    var id: String { get }
    var flightNumber: String { get }
    var departureDate: Date { get }
    var arrivalDate: Date { get }
    var destination: String { get }
    var origin: String { get }
    
}

extension FlightType {
    
    var duration: TimeInterval {
        return arrivalDate.timeIntervalSince(self.departureDate)
    }
    
}
