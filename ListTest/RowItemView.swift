//
//  RowItemView.swift
//  ListTest
//
//  Created by 신상원 on 2022/11/11.
//

import SwiftUI

struct RowItemView: View {
  var body: some View {
    HStack {
      Image(systemName: "person.fill")
        .resizable()
        .frame(width: 24, height: 24)
        .cornerRadius(12)

      Button(
        action: {
          print("123")
        },
        label: {
          Text("TEST")
        }
      )
      .buttonStyle(PlainButtonStyle())


      Spacer()

      Button(
        action: {
          print("456")
        },
        label: {
          Text("123TEST123")
        }
      )
      .buttonStyle(PlainButtonStyle())

    }
  }
}
