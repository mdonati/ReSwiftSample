//
//  ClockViewModel.swift
//  ReSwiftSample
//
//  Created by Mariano Donati on 18/12/17.
//  Copyright © 2017 Mariano Donati. All rights reserved.
//

import Foundation

struct ClockViewModel : ClockViewModelType {
    
    private(set) var currentTime: Observable<String>
    
    init(currentTime: String) {
        self.currentTime = Observable<String>(currentTime)
    }
    
}
