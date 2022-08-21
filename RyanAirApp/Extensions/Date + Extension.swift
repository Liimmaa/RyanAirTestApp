//
//  Date + Extension.swift
//  RyanAirApp
//
//  Created by Chioma Amanda Mmegwa  on 19/08/2022.
//

import Foundation

extension Date {
    func dateFormatter() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        return dateFormatter.string(from: self)
    }
}
