//
//  HealthMetric.swift
//  StepTracker
//
//  Created by Renato Oliveira Fraga on 5/20/24.
//

import Foundation

struct HealthMetric: Identifiable {
  let id = UUID()
  let date: Date
  let value: Double
}
