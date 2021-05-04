//
//  NearByCars_Models.swift
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

enum NearByCars_
{
  // MARK: Use cases
  
  enum Fetch
  {
    struct Request
    {
    }
    struct Response
    {
        let nearByCarModel: [NearByCarModel]
    }
    struct ViewModel
    {
        let nearByCarModel: [NearByCarModel]
    }
  }
}
