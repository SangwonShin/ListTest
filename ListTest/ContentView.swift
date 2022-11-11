//
//  ContentView.swift
//  ListTest
//
//  Created by 신상원 on 2022/11/11.
//

import SwiftUI

struct ContentView: View {
  @State
  var scrollOffset = CGFloat.zero

  var body: some View {
    VStack {
      Text("\(scrollOffset)")
        .font(.largeTitle)

      TrackableListView(scrollOffset: $scrollOffset) {
        ForEach(1...20, id: \.self) { id in
          RowItemView()
            .swipeActions {
              Button("Order") {
                print("Awesome!")
              }
              .tint(.green)
            }
        }
      }
      .listStyle(.plain)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
