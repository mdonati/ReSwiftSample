//
//  FlightDetailedViewModel.swift
//  ReSwiftSample
//
//  Created by Mariano Donati on 18/12/17.
//  Copyright © 2017 Mariano Donati. All rights reserved.
//

import Foundation

struct FlightDetailedViewModel : FlightDetailedViewModelType {
    
    private(set) var description: Observable<String>
    private(set) var departureDate: Observable<String>
    private(set) var arrivalDate: Observable<String>
    
    init(description: String, departureDate: String, arrivalDate: String) {
        self.description = Observable<String>(description)
        self.departureDate = Observable<String>(departureDate)
        self.arrivalDate = Observable<String>(arrivalDate)
    }
    
}
