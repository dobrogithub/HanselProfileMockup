//
//  PlacesCollectionViewCell.swift
//  HanselProfileMockup
//
//  Created by Paolo Dobrowolny on 11/29/18.
//  Copyright © 2018 Hansel. All rights reserved.
//

import UIKit

// Defines properties of a Place in the bottom profile section. Used to populate places entries
struct Place {
    let cityName : String
    let bkgImgStr : String
    let iconImgStr: String
    let numSpots: Int
}


class PlacesCollectionViewCell: UICollectionViewCell, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var placesTableView: UITableView!
    @IBOutlet weak var addPlaceBtn: UIButton!

    // Set to a fixed value from excercise. Would be set by a call to the backend on a full app implementation
    var userPlaces = [Place]()
    
    override func awakeFromNib() {
        setBtnUI()
        loadPlaces()
        
        // Keeps the aspect ratio of city background image when screen size varies (tested on iPhone 5s, iPhone 8 and iPhone 8Plus)
        placesTableView.rowHeight = UITableView.automaticDimension
        placesTableView.estimatedRowHeight = 142
        
        // Updates the profile section with the places loaded by loadPlaces()
        placesTableView.reloadData()
    }
    
    // Adjusts UI of Add Place button
    func setBtnUI()
    {
        addPlaceBtn.layer.cornerRadius = 2
        addPlaceBtn.layer.borderWidth = 1
        addPlaceBtn.layer.borderColor = hexStringToUIColor(hex: "#00CCB3").cgColor
    }
    
    // Loads user's places
    func loadPlaces() {
        userPlaces = [
            //Place(bkgImgStr:"Paris", numSpots: 3),
            //Place(bkgImgStr:"LosAngeles", numSpots: 5)

            Place(cityName:"New York", bkgImgStr:"NewYork", iconImgStr: "NewYork_Icon_White", numSpots: 3),
            Place(cityName:"Los Angeles", bkgImgStr:"LosAngeles", iconImgStr: "LosAngeles_Icon_White", numSpots: 5),
            Place(cityName:"Tokyo", bkgImgStr:"Tokyo", iconImgStr: "Tokyo_Icon_White", numSpots: 1)
        ]
    }
    
    
    // TableView has only 1 section
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // TableView has rows equal to the number of places loaded by the app (2 in the excercise)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userPlaces.count
    }
    
    // Cells are custom PlaceTableViewCell cells whose values are set by the struct Places defined above
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // uses the identifier set in interface builder
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "PlaceTableViewCell",
            for: indexPath)  as UITableViewCell
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        
        guard let placeCell = cell as? PlaceTableViewCell else {
            return cell
        }
        
        placeCell.configureCell(place: userPlaces[indexPath.row])
        return placeCell
    }
}
