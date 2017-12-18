//
//  DetailedFlightView.swift
//  ReSwiftSample
//
//  Created by Mariano Donati on 18/12/17.
//  Copyright © 2017 Mariano Donati. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class FlightDetailedView : UIView {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var departureDateLabel: UILabel!
    @IBOutlet weak var arrivalDateLabel: UILabel!
    
    var viewModel: FlightDetailedViewModelType? {
        didSet {
            self.refresh()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupXib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupXib()
    }
    
    private func refresh() {
        self.descriptionLabel.text = self.viewModel?.description.value
        self.departureDateLabel.text = self.viewModel?.departureDate.value
        self.arrivalDateLabel.text = self.viewModel?.arrivalDate.value
    }
    
}
