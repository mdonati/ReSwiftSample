//
//  FlightBriefView.swift
//  ReSwiftSample
//
//  Created by Mariano Donati on 18/12/17.
//  Copyright © 2017 Mariano Donati. All rights reserved.
//

import Foundation
import UIKit

class FlightBriefView : UIView {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var departureDateLabel: UILabel!
    
    var viewModel: FlightBriefViewModelType? {
        didSet {
            self.refresh()
        }
    }
    
    static func instanceFromNib() -> FlightBriefView {
        let nibViews = Bundle.main.loadNibNamed("FlightBriefView", owner: self, options: nil)!
        return nibViews.first as! FlightBriefView
    }
    
    private func refresh() {
        self.descriptionLabel.text = self.viewModel?.description.value
        self.departureDateLabel.text = self.viewModel?.departureDate.value
    }
}
