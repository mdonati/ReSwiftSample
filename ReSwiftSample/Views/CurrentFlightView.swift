//
//  CurrentFlightView.swift
//  ReSwiftSample
//
//  Created by Mariano Donati on 18/12/17.
//  Copyright © 2017 Mariano Donati. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class CurrentFlightView : UIView {
    
    @IBOutlet weak var flightView: FlightDetailedView!
    @IBOutlet weak var noFlightView: UILabel!
    
    var viewModel: CurrentFlightViewModelType? {
        didSet {
            self.refresh()
            self.viewModel?.status.subscribe(self) { [weak self] old, new in
                self?.refresh()
            }
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
        
        self.flightView.isHidden = true
        self.noFlightView.isHidden = false
        
        guard let viewModel = self.viewModel else { return }
        
        switch viewModel.status.value {
            
        case .available(let viewModel):
            self.flightView.viewModel = viewModel
            self.flightView.isHidden = false
            self.noFlightView.isHidden = true
            
        case .none:
            break
            
        }
        
    }
    
}
