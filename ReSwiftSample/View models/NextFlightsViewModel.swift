//
//  NextFlightsViewModel.swift
//  ReSwiftSample
//
//  Created by Mariano Donati on 18/12/17.
//  Copyright © 2017 Mariano Donati. All rights reserved.
//

import Foundation

struct NextFlightsViewModel : NextFlightsViewModelType {
    
    private(set) var status: Observable<NextFlightsStatus>
    
    init(status: NextFlightsStatus) {
        self.status = Observable<NextFlightsStatus>(status)
    }
    
}
