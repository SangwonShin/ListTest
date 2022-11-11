//
//  TrackableListView.swift
//  ListTest
//
//  Created by 신상원 on 2022/11/11.
//

import SwiftUI

// https://stackoverflow.com/questions/74047146/tracking-scroll-position-in-a-list-swiftui
struct TrackableListView<Content: View>: View {
  @Namespace var scrollSpace

  @Binding var scrollOffset: CGFloat
  //  let content: (ScrollViewProxy) -> Content
  let content: Content

  @State
  var maxHeight: CGFloat = 0.0

  //  init(scrollOffset: Binding<CGFloat>,
  //       @ViewBuilder content: @escaping (ScrollViewProxy) -> Content) {
  //    _scrollOffset = scrollOffset
  //    self.content = content
  //  }

  init(scrollOffset: Binding<CGFloat>,
       @ViewBuilder content: () -> Content) {
    _scrollOffset = scrollOffset
    self.content = content()
  }

  var body: some View {
    List {
      GeometryReader { geo in
        let offset = -geo.frame(in: .named(scrollSpace)).origin.y
        Divider().opacity(0)
          .frame(width: 0, height: 0)
          .preference(
            key: ScrollOffsetPreferenceKey.self,
            value: offset
          )
          .onAppear {
            print("offset", offset)
            if maxHeight == 0 {
              maxHeight = offset * 2
            }
          }
      }
      .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
      .listRowSeparator(.hidden)
      .frame(width: 0, height: 0)

      content
    }
    .coordinateSpace(name: scrollSpace)
    .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
      //      print("Value: ", value)
      scrollOffset = value - maxHeight
    }
  }
}

private struct ScrollOffsetPreferenceKey: PreferenceKey {
  static var defaultValue = CGFloat.zero

  static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
    value += nextValue()
  }
}
