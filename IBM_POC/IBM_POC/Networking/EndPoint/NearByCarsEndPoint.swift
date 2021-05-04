//
//  NearByCarsEndPoint.swift
//  IBM_POC
//
//  Created by Darshan on 04/05/21.
//

import Foundation

public enum NearByCarsEndPoint {
    case nearByCars
    
}

extension NearByCarsEndPoint: EndPointType {
    
    var path: String {
        switch self {
        case .nearByCars:
            return "v2/5dc3f2c13000003c003477a0"
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .nearByCars:
            return .request
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .nearByCars:
            return .get
        }
    }
}
