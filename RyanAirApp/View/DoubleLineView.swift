//
//  DoubleLineView.swift
//  RyanAirApp
//
//  Created by Chioma Amanda Mmegwa  on 18/08/2022.
//

import SwiftUI

struct DoubleLineView: View {
    var name: String
    var value: String
    
    var body: some View {
        VStack(spacing:10) {
            Text("\(value)")
                .font(.system(size: 16))
                .fontWeight(.semibold)
            Text("\(name)")
                .font(.system(size: 12))
        }
    }
}
