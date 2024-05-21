//
//  HealthKitPermissionPrimingView.swift
//  StepTracker
//
//  Created by Renato Oliveira Fraga on 5/3/24.
//

import SwiftUI
import HealthKitUI

struct HealthKitPermissionPrimingView: View {

  @Environment(HealthKitManager.self) private var hkManager
  @Environment(\.dismiss) private var dismiss
  @State private var isShowingHealthKitPermission = false
  @Binding var hasSeen: Bool
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
        isShowingHealthKitPermission = true
      }
      .buttonStyle(.borderedProminent)
      .tint(.pink)
    }.padding(30)
      .interactiveDismissDisabled()
      .onAppear {  hasSeen = true }
      .healthDataAccessRequest(store: hkManager.store,
                               shareTypes: hkManager.writeTypes,
                               readTypes: hkManager.readTypes,
                               trigger: isShowingHealthKitPermission) { result in
        switch result {

        case .success(_):
          dismiss()
        case .failure(_):
          //handle error
          dismiss()
        }
      }
  }
}

#Preview {
  HealthKitPermissionPrimingView(hasSeen: .constant(true))
    .environment(HealthKitManager())
}
