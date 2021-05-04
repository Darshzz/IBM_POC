//
//  NetworkManager.swift
//  IBM_POC
//
//  Created by Darshan on 04/05/21.
//

import Foundation

enum NetworkResponse:String {
    case success
    case authenticationError = "You need to be authenticated first."
    case badRequest = "Bad request"
    case outdated = "The url you requested is outdated."
    case failed = "Network request failed."
    case noData = "Response returned with no data to decode."
    case unableToDecode = "We could not decode the response."
}

enum Result<String>{
    case success
    case failure(String)
}

protocol FetcherServiceProtocol {
    
    func request<T: Decodable>(_ route: EndPointType, showHud: Bool, completion: @escaping (T?, String?) -> ())
}

extension FetcherServiceProtocol {
    func request<T: Decodable>(_ route: EndPointType, showHud: Bool = true, completion: @escaping (T?, String?) -> ()) { }
}

struct NetworkManager: FetcherServiceProtocol {
    
    static let environment : NetworkEnvironment = .dev
    let router = Router()
    
    func request<T: Decodable>(_ route: EndPointType, showHud: Bool = true, completion: @escaping (T?, String?) -> ()) {
        
        router.request(route) { (data, response, error) in
            
            guard let responseData = data, error == nil else {
                // Show error through alert
                print(error.debugDescription)
                return
            }
            
            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                switch result {
                case .success:
                    do {
                        let model = try JSONDecoder().decode(T.self, from: responseData)
                        completion(model, nil)
                    } catch let jsonErr {
                        print("failed to decode, \(jsonErr)")
                        completion(nil, jsonErr.localizedDescription)
                    }
                case .failure(let networkFailureError):
                    print("Error ===== ", networkFailureError)
                    completion(nil, networkFailureError)
                }
            }
        }
    }
    
    fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String>{
        switch response.statusCode {
        case 200...400: return .success
        case 401...500: return .failure(NetworkResponse.authenticationError.rawValue)
        case 501...599: return .failure(NetworkResponse.badRequest.rawValue)
        case 600: return .failure(NetworkResponse.outdated.rawValue)
        default: return .failure(NetworkResponse.failed.rawValue)
        }
    }
}
