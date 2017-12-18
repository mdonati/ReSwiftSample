//
//  ViewController.swift
//  ReSwiftSample
//
//  Created by Mariano Donati on 18/12/17.
//  Copyright © 2017 Mariano Donati. All rights reserved.
//

import UIKit
import ReSwift

class ViewController: UIViewController {

    @IBOutlet weak var clock: ClockView!
    @IBOutlet weak var currentFlightView: CurrentFlightView!
    @IBOutlet weak var nextFlightsView: NextFlightsView!
    
    private var clockPresenter: ClockViewPresenter!
    private var flightsPresenter: FlightsPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setClockPresenter()
        self.setFlightsPresenter()
        appController.store.dispatch(fetchFlights())
        self.tick()
    }
    
    @objc private func tick() {
        appController.store.dispatch(AppAction.tick)
        self.perform(#selector(self.tick), with: nil, afterDelay: 1)
    }

    private func setClockPresenter() {
        self.clockPresenter = ClockViewPresenter(timeState: appController.store.state.timeState)
        self.clock.viewModel = self.clockPresenter.clockViewModel
    }
    
    private func setFlightsPresenter() {
        self.flightsPresenter = FlightsPresenter(flightsState: appController.store.state.flightsState)
        self.currentFlightView.viewModel = self.flightsPresenter.currentFlightViewModel
        self.nextFlightsView.viewModel = self.flightsPresenter.nextFlightsViewModel
    }

}

