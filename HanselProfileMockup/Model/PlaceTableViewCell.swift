//
//  PlaceTableViewCell.swift
//  HanselProfileMockup
//
//  Created by Paolo Dobrowolny on 11/29/18.
//  Copyright © 2018 Hansel. All rights reserved.
//

import UIKit

class PlaceTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cityNameLbl: UILabel!
    @IBOutlet weak var numSpotsLbl: UILabel!
    @IBOutlet weak var cityIconImg: UIImageView!
    @IBOutlet weak var cityBkgImg: UIImageView!

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // Configures the place custom cell (city name, white icon img, background image, number of spots)
    func configureCell(place: Place) {
        cityNameLbl.text = place.cityName
        cityIconImg.image = UIImage(named: place.iconImgStr)
        cityBkgImg.image = UIImage(named: place.bkgImgStr)
        
        // Assumes that a place will not be loaded from the server if the visited spots are = 0
        // If only 1 spot has been visited it writes "spot" instead of spots
        if (place.numSpots == 1) {
            numSpotsLbl.text = "1 spot"
        }
        else {
            numSpotsLbl.text = String(place.numSpots) + " spots"
        }
    }
    
}
