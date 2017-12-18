//
//  ClockViewModel.swift
//  ReSwiftSample
//
//  Created by Mariano Donati on 18/12/17.
//  Copyright © 2017 Mariano Donati. All rights reserved.
//

import Foundation

/// A presenter that binds time state to clock view model
class ClockViewPresenter {
    
    private let timeState: TimeState

    deinit {
        self.timeState.currentTime.unsubscribe(self)
    }

    init(timeState: TimeState) {
        self.timeState = timeState
        
        self.timeState.currentTime.subscribe(self) { [weak self] old, new in
            guard let strongSelf = self else { return }
            strongSelf.clockViewModel.currentTime.value = strongSelf.currentTime
        }
    }

    lazy var clockViewModel: ClockViewModelType = {
        return ClockViewModel(currentTime: self.currentTime)
    }()
    
    private var currentTime: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        return formatter.string(from: self.timeState.currentTime.value)
    }
    
}
