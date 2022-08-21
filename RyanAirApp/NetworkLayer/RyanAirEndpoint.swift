//
//  RyanAirEndpoint.swift
//  RyanAirApp
//
//  Created by Chioma Amanda Mmegwa  on 17/08/2022.
//

import Foundation

enum RyanAirEndpoint: Endpoint {
    
    case getAvailableStations
    case getFlights(origin: String, destination: String, dateout: String, adt: Int, teen: Int, chd: Int)
    
    var scheme: String {
        switch self {
        default:
            return "https"
        }
    }
    
    var baseURL: String {
        switch self {
        case .getAvailableStations:
            return "mobile-testassets-dev.s3.eu-west-1.amazonaws.com"
        case .getFlights(_, _, _, _, _, _):
            return "nativeapps.ryanair.com"
        }
    }
    
    var path: String {
        switch self {
        case .getAvailableStations:
            return "/stations.json"
        case .getFlights(_, _, _, _, _, _):
            return "/api/v4/Availability"
        }
    }
    
    var parameters: [URLQueryItem]? {        
        switch self {
        case .getAvailableStations:
            return nil
        case .getFlights(let origin, let destination, let dateout, let adt, let teen, let chd):
            return [URLQueryItem(name: "origin", value: origin),
                    URLQueryItem(name: "destination", value: destination),
                    URLQueryItem(name: "dateout", value: dateout),
                    URLQueryItem(name: "adt", value:  String(adt)),
                    URLQueryItem(name: "teen", value: String(teen)),
                    URLQueryItem(name: "chd", value: String(chd))]
            
        }
    }
    
    var method: String {
        switch self {
        default:
            return "GET"
        }
    }
}
