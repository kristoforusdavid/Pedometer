//
//  ViewController.swift
//  Pedometer
//
//  Created by Kristoforus David on 07/01/20.
//  Copyright © 2020 Kristoforus David. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    private let activityManager = CMMotionActivityManager()
    private let pedometer = CMPedometer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myPedometer()
    }

    func myPedometer() {
        if CMPedometer.isStepCountingAvailable(){
            let calendar = Calendar.current
            pedometer.queryPedometerData(from: calendar.startOfDay(for: Date()), to: Date()) { (data, error) in
                print(data)
            }
            pedometer.startUpdates(from: Date(), withHandler: { (data, error) in
                print(data)
            })
        }
    }

}

