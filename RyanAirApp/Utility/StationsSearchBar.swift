//
//  StationsSearchBar.swift
//  RyanAirApp
//
//  Created by Chioma Amanda Mmegwa  on 17/08/2022.
//

import Foundation
import SwiftUI

struct StationsSearchBar: View {
    @Binding var text: String
    @State var isEditing: Bool = false
    
    var body: some View {
        HStack {
            TextField(Constants.searchStation, text: $text)
                .padding(7)
                .padding(.horizontal, 40)
                .background(.white)
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: Constants.magnifyingglass )
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                        if isEditing {
                            Button(action: {
                                self.text = ""
                            }) {
                                Image(systemName: Constants.circleFill)
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                }
            if isEditing {
                Button(action: {
                    UIApplication.shared.endEditing(true)
                    self.isEditing = false
                    self.text = ""
                }) {
                    Text(Constants.cancel)
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default, value: 0)
            }
        }
    }
}
extension UIApplication {
    func endEditing(_ force: Bool) {
        self.windows
            .filter{$0.isKeyWindow}
            .first?
            .endEditing(force)
    }
}
struct ResignKeyboardOnDragGesture: ViewModifier {
    var gesture = DragGesture().onChanged{_ in
        UIApplication.shared.endEditing(true)
    }
    func body(content: Content) -> some View {
        content.gesture(gesture)
    }
}
extension View {
    func resignKeyboardOnDragGesture() -> some View {
        return modifier(ResignKeyboardOnDragGesture())
    }
}
