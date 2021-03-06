//
//  NearByCars_Worker.swift
//  IBM_POC
//
//  Created by Darshan on 04/05/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol NearByCars_WorkerOutput: AnyObject {
    func fetchedCarList(model: [NearByCarModel])
}

class NearByCars_Worker {
    
    let network: NetworkManager = NetworkManager()
    weak var output: NearByCars_WorkerOutput!
    
  func fetchNearByCars() {
    
    network.request(NearByCarsEndPoint.nearByCars) { [weak self] (model: [NearByCarModel]?, error) in
        
        guard let dataModel = model else { return }
        self?.output.fetchedCarList(model: dataModel)
        
    }
  }
}
