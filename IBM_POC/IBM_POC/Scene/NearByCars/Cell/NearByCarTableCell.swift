//
//  NearByCarTableCell.swift
//  IBM_POC
//
//  Created by Darshan on 04/05/21.
//

import UIKit
import Kingfisher

class NearByCarTableCell: UITableViewCell {

    // MARK: IBOutlet Properties
    @IBOutlet weak var imageViewCar: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDetail: UILabel!
    @IBOutlet weak var lblSubDetail: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(model: NearByCarModel) {
        lblName.text = model.vehicleDetails.name
        lblDetail.text = "\(model.vehicleDetails.make), \(model.modelName)"
        
        let fuelType = model.vehicleDetails.fuel_type == Constant.NearByCars.petrolInitial ? Constant.NearByCars.petrol : Constant.NearByCars.diesel
        lblSubDetail.text = "Fuel Type: \(fuelType)"
        
        let url = URL(string: model.carImageUrl)
        imageViewCar.kf.setImage(with: url)
    }

}
