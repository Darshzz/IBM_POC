//
//  SuccessResponse.swift
//  IBM_POC
//
//  Created by Darshan on 04/05/21.
//

import Foundation

struct SuccessResponse: Decodable {
    let success: Bool
    let error_code: String
    let error_message: String
}
