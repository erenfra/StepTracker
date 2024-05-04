//
//  StepTrackerApp.swift
//  StepTracker
//
//  Created by Renato Oliveira Fraga on 5/1/24.
//

import SwiftUI

@main
struct StepTrackerApp: App {

  let hkManager = HealthKitManager()
  var body: some Scene {
    WindowGroup {
      DashboardView()
        .environment(hkManager)
    }
  }
}
