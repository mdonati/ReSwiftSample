//
//  FlightBriefViewModel.swift
//  ReSwiftSample
//
//  Created by Mariano Donati on 18/12/17.
//  Copyright © 2017 Mariano Donati. All rights reserved.
//

import Foundation

struct FlightBriefViewModel : FlightBriefViewModelType {
    
    private(set) var description: Observable<String>
    private(set) var departureDate: Observable<String>
    
    init(description: String, departureDate: String) {
        self.description = Observable<String>(description)
        self.departureDate = Observable<String>(departureDate)
    }
    
}
