//
//  Double + Extension.swift
//  RyanAirApp
//
//  Created by Chioma Amanda Mmegwa  on 19/08/2022.
//

import Foundation

extension Double {
    func currencyFormatted() -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currency
        if let formattedAmount = formatter.string(from: self as NSNumber) {
            return formattedAmount
        }
        return ""
    }
}
