//
//  ClockViewModelType.swift
//  ReSwiftSample
//
//  Created by Mariano Donati on 18/12/17.
//  Copyright © 2017 Mariano Donati. All rights reserved.
//

import Foundation

protocol ClockViewModelType {
    
    var currentTime: Observable<String> { get }
    
}
