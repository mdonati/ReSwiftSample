//
//  FlightsListView.swift
//  ReSwiftSample
//
//  Created by Mariano Donati on 18/12/17.
//  Copyright © 2017 Mariano Donati. All rights reserved.
//

import Foundation
import UIKit

class FlightsListView : UIView {
    
    var viewModels: [FlightBriefViewModelType]? {
        didSet {
            self.refresh()
        }
    }
    
    private func refresh() {
        for subview in self.subviews {
            subview.removeFromSuperview()
        }
        
        guard let viewModels = self.viewModels else { return }
        
        var origin = CGPoint(x: 0, y: 0)
        for viewModel in viewModels {
            let flightView = FlightBriefView.instanceFromNib()
            flightView.viewModel = viewModel
            flightView.frame = CGRect(x: origin.x, y: origin.y, width: self.bounds.width, height: flightView.bounds.height)
            self.addSubview(flightView)
            origin.y += flightView.bounds.height
        }
    }
    
}
