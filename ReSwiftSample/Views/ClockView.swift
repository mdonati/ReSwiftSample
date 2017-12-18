//
//  Clock.swift
//  ReSwiftSample
//
//  Created by Mariano Donati on 18/12/17.
//  Copyright © 2017 Mariano Donati. All rights reserved.
//

import Foundation
import UIKit

class ClockView : UILabel {
    
    var viewModel: ClockViewModelType? {
        didSet {
            self.setTime()
            self.viewModel?.currentTime.subscribe(self) { [weak self] old, new in
                self?.setTime()
            }
        }
    }
    
    deinit {
        self.viewModel?.currentTime.unsubscribe(self)
    }
    
    private func setTime() {
        self.text = self.viewModel?.currentTime.value
    }
    
}
