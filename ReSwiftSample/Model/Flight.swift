//
//  Flight.swift
//  ReSwiftSample
//
//  Created by Mariano Donati on 18/12/17.
//  Copyright © 2017 Mariano Donati. All rights reserved.
//

import Foundation

struct Flight : FlightType {
    
    var id: String
    var flightNumber: String
    var departureDate: Date
    var arrivalDate: Date
    var origin: String
    var destination: String
    
}
