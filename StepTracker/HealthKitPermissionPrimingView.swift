//
//  HealthKitPermissionPrimingView.swift
//  StepTracker
//
//  Created by Renato Oliveira Fraga on 5/3/24.
//

import SwiftUI

struct HealthKitPermissionPrimingView: View {

  var description = """
  This app display your steps and weight data in interactive charts.

  You can also add new step or weight data to Apple Health from this app. Your data is private and secured.
  """

  var body: some View {
    VStack(spacing: 130) {
      VStack(alignment: .leading, spacing: 10) {
        Image(.appleHealth)
          .resizable()
          .frame(width: 90, height: 90)
          .shadow(color: .gray.opacity(0.3), radius: 16)
          .padding(12)

        Text("Apple Health Integration")
          .font(.title2.bold())
        Text(description)
          .foregroundStyle(.secondary)
      }
      Button("Connect Apple Health") {
        // do code later
      }
      .buttonStyle(.borderedProminent)
      .tint(.pink)
    }.padding(30)
  }
}

#Preview {
  HealthKitPermissionPrimingView()
}
