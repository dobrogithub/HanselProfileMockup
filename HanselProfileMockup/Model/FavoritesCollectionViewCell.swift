//
//  FavoritesCollectionViewCell.swift
//  HanselProfileMockup
//
//  Created by Paolo Dobrowolny on 11/28/18.
//  Copyright © 2018 Hansel. All rights reserved.
//

import UIKit

class FavoritesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var emojiFace: UILabel!
    @IBOutlet weak var exploreButton: UIButton!
    
    override func awakeFromNib() {
        setEmojiUI()
        setBtnUI()
    }
    
    // Initialize the emoji. Useing img unicode (instead of loading an image) limits the size of app
    func setEmojiUI() {
        emojiFace.backgroundColor = UIColor.clear
        emojiFace.text = "\u{1F632}"
    }
    
    // Edits the button adding the rounded corners and outline
    func setBtnUI() {
        exploreButton.backgroundColor = .clear
        exploreButton.layer.cornerRadius = 2
        exploreButton.layer.borderWidth = 1
        exploreButton.layer.borderColor = hexStringToUIColor(hex: "#00CCB3").cgColor
    }
}
