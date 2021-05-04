//
//  MFHome_Configurator.swift
//  MutualFundSDK
//
//  Created by Darshan Mothreja on 19/11/20.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.


import UIKit

struct NearByCars_Configurator {
    
    // MARK: Configuration
    static func configure(viewController: NearByCars_ViewController) {
        
        let interactor = NearByCars_Interactor()
        interactor.worker?.output = interactor
        let presenter = NearByCars_Presenter()
        let router = NearByCars_Router()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}
