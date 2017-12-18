//
//  NextFlightsView.swift
//  ReSwiftSample
//
//  Created by Mariano Donati on 18/12/17.
//  Copyright © 2017 Mariano Donati. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class NextFlightsView : UIView {
    
    @IBOutlet weak var noFlightsView: UILabel!
    @IBOutlet weak var flightsView: FlightsListView!
    
    var viewModel: NextFlightsViewModelType? {
        didSet {
            self.refresh()
            self.viewModel?.status.subscribe(self) { [weak self] old, new in
                self?.refresh()
            }
        }
    }
    
    deinit {
        self.viewModel?.status.unsubscribe(self)
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
        
        self.noFlightsView.isHidden = false
        self.flightsView.isHidden = true
        
        guard let viewModel = self.viewModel else { return }
        
        switch viewModel.status.value {
            
        case .available(let viewModels):
            self.flightsView.viewModels = viewModels
            self.flightsView.isHidden = false
            self.noFlightsView.isHidden = true
            
        case .none:
            break
            
        }
        
    }
    
}
