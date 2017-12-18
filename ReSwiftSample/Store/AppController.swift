//
//  AppController.swift
//  ReSwiftSample
//
//  Created by Mariano Donati on 18/12/17.
//  Copyright © 2017 Mariano Donati. All rights reserved.
//

import Foundation
import ReSwift

let appController = AppController()

class AppController {
    
    let store = Store<AppState>(reducer: appReducer, state: nil)
    
}
