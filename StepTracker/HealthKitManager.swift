//
//  HealthKitManager.swift
//  StepTracker
//
//  Created by Renato Oliveira Fraga on 5/3/24.
//

import Foundation
import HealthKit
import Observation

@Observable class HealthKitManager {
  let store = HKHealthStore()
  let readTypes: Set = [HKQuantityType(.stepCount), HKQuantityType(.bodyMass)]
  let writeTypes: Set = [HKQuantityType(.stepCount), HKQuantityType(.bodyMass)]

}
