//
//  FlightBriefViewModelType.swift
//  ReSwiftSample
//
//  Created by Mariano Donati on 18/12/17.
//  Copyright © 2017 Mariano Donati. All rights reserved.
//

import Foundation

protocol FlightBriefViewModelType {
    
    var description: Observable<String> { get }
    var departureDate: Observable<String> { get }
    
}
