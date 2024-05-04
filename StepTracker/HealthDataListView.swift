//
//  HealthDataListView.swift
//  StepTracker
//
//  Created by Renato Oliveira Fraga on 5/3/24.
//

import SwiftUI

struct HealthDataListView: View {
  var metric: HealthMetricContext
  @State private var addDataDate: Date = .now
  @State private var valueToAdd = ""
  @State private var isShowingAddData = false
  
  var body: some View {
    List(0..<25) { i in
      HStack {
        Text(Date(), format: .dateTime.month().day().year())
        Spacer()
        Text(10000, format: .number.precision(.fractionLength(metric == .steps ? 0 : 1)))
      }
    }
    .navigationTitle(metric.title)
    .sheet(isPresented: $isShowingAddData) {
      adddataView
    }
    .toolbar {
      Button("Add Data", systemImage: "plus") {
        isShowingAddData = true
      }
    }
  }

  var adddataView: some View {
    NavigationStack {
      Form {
        DatePicker("Date", selection: $addDataDate, displayedComponents: .date)
        HStack {
          Text(metric.title)
          Spacer()
          TextField("Value", text: $valueToAdd)
            .multilineTextAlignment(.trailing)
            .frame(width: 140)
            .keyboardType(metric == .steps ? .numberPad : .decimalPad)
        }
      }
      .navigationTitle(metric.title)
      .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          Button("Add Data") {
            // Do code here
          }
        }
        ToolbarItem(placement: .topBarLeading) {
          Button("Dismiss") {
            isShowingAddData = false
          }
        }
      }
    }
  }

}

#Preview {
  NavigationStack {
    HealthDataListView(metric: .steps)
  }
}
