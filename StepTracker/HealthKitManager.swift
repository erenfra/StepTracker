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
  let types: Set = [HKQuantityType(.stepCount), HKQuantityType(.bodyMass)]

  func fetchStepCount() async {

    let calendar = Calendar.current
    let today = calendar.startOfDay(for: .now)
    let endDate = calendar.date(byAdding: .day, value: 1, to: today)!
    let startDate = calendar.date(byAdding: .day, value: -28, to: endDate)

    let queryPredicate = HKQuery.predicateForSamples(withStart: startDate, end: endDate)
    let samplePredicate = HKSamplePredicate.quantitySample(type: HKQuantityType(.stepCount), predicate: queryPredicate)
    let stepsQuery = HKStatisticsCollectionQueryDescriptor(predicate: samplePredicate, options: .cumulativeSum, anchorDate: endDate, intervalComponents: .init(day: 1))

    let stepsCounts = try! await stepsQuery.result(for: store)

  }

  func fetchWeight() async {

    let calendar = Calendar.current
    let today = calendar.startOfDay(for: .now)
    let endDate = calendar.date(byAdding: .day, value: 1, to: today)!
    let startDate = calendar.date(byAdding: .day, value: -28, to: endDate)

    let queryPredicate = HKQuery.predicateForSamples(withStart: startDate, end: endDate)
    let samplePredicate = HKSamplePredicate.quantitySample(type: HKQuantityType(.bodyMass), predicate: queryPredicate)
    let weightsQuery = HKStatisticsCollectionQueryDescriptor(predicate: samplePredicate, options: .mostRecent, anchorDate: endDate, intervalComponents: .init(day: 1))

    let weights = try! await weightsQuery.result(for: store)

  }

//  func addSimulatorData() async {
//    var mockSamples: [HKQuantitySample] = []
//
//    for i in 0..<28 {
//      let stepQuantity = HKQuantity(unit: .count(), doubleValue: .random(in: 4_000...20_000))
//      let weightQuantity = HKQuantity(unit: .pound(), doubleValue: .random(in: (160 + Double(i/3)...165 + Double(i/3))))
//
//      let startDate = Calendar.current.date(byAdding: .day, value: -i, to: .now)!
//      let endDate = Calendar.current.date(byAdding: .hour, value: 1, to: startDate)!
//
//      let stepSample = HKQuantitySample(type: HKQuantityType(.stepCount), quantity: stepQuantity, start: startDate, end: endDate)
//      let weigthSample = HKQuantitySample(type: HKQuantityType(.bodyMass), quantity: weightQuantity, start: startDate, end: endDate)
//
//      mockSamples.append(stepSample)
//      mockSamples.append(weigthSample)
//    }
//
//    try! await store.save(mockSamples)
//    print("Dummy data sent up")
//
//  }


}
