//
//  EndPoint.swift
//  IBM_POC
//
//  Created by Darshan on 04/05/21.
//

import Foundation

fileprivate extension String {
    static var contentType = "Content-Type"
    static var multipart = "multipart/form-data; boundary=mediaBoundary"
    static var applicationJson = "application/json"
    static var authorizationHeader = "Authorization"
    
    static var apiOSTypeHeader = "OS-Type"
    
    static var appVersion: String {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
    }
}

enum RequestContentType: String {
    case none
    case applicationJson
}

protocol CommonHeaders {
    var authorizationRequired: Bool { get }
    var contentType: RequestContentType { get }
    var commonHeaders: [String: String]? { get }
}

extension CommonHeaders {
    
    var commonHeaders: [String: String]? {
        var headers: [String: String] = [:]
        
        switch contentType {
        case .applicationJson:
            headers[.contentType] = .applicationJson
        default:
            break
        }
        
        return headers
    }
}


protocol EndPointType: CommonHeaders {
    var environmentBaseURL: String { get }
    var baseURL: URL { get }
    var path: String { get }
    var task: HTTPTask { get }
    var httpMethod: HTTPMethod { get }
    var headers: [String: String]? { get }
}

extension EndPointType {
    
    var environmentBaseURL : String {
        switch NetworkManager.environment {
        case .dev: return "http://www.mocky.io/"
        }
    }
    
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var headers: [String: String]? {
        return commonHeaders
    }
    
    var authorizationRequired: Bool {
        return true
    }
    
    var contentType: RequestContentType {
        return .applicationJson
    }
}

enum NetworkEnvironment {
    case dev
}
