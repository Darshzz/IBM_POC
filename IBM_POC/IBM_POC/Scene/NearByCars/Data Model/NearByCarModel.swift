//
//  NearByCarModel.swift
//  IBM_POC
//
//  Created by Darshan on 04/05/21.
//

import Foundation

struct NearByCarModel: Decodable {
    let modelName: String
    let carImageUrl: String
    let vehicleDetails: VehicleDetails
    let location: Location
    
    struct VehicleDetails: Decodable {
        let name: String
        let make: String
        let color: String
        let fuel_type: String
    }
    
    struct Location: Decodable {
        let latitude: Double
        let longitude: Double
    }
}
