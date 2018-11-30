//
//  FriendTableViewCell.swift
//  HanselProfileMockup
//
//  Created by Paolo Dobrowolny on 11/29/18.
//  Copyright © 2018 Hansel. All rights reserved.
//

import UIKit

class FriendTableViewCell: UITableViewCell {
    
    @IBOutlet weak var friendProfileImg: UIImageView!
    @IBOutlet weak var friendNameLbl: UILabel!
    @IBOutlet weak var friendHandleLbl: UILabel!
    @IBOutlet weak var friendFollowBtn: UIButton!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // Configures the friend custom cell (name, handle, profile image, button follow/unfollow)
    func configureCell(friend: Friend) {
        friendNameLbl.text = friend.name
        friendHandleLbl.text = "@" + friend.handle
        friendProfileImg.image = UIImage(named: friend.imgStr)
        
        // Configures the button depending on the followed toggle
        if (friend.followed) {
            setBtnUnfollow()
        }
        else {
            setBtnFollow()
        }
    }
    
    
    // Sets the button to "Unfollow" (user is already following friend)
    @objc func setBtnUnfollow() {
        friendFollowBtn.layer.cornerRadius = 0
        friendFollowBtn.layer.borderWidth = 0
        friendFollowBtn.layer.borderColor = UIColor.clear.cgColor
        friendFollowBtn.setTitleColor(hexStringToUIColor(hex: "#BBC6CE"), for: .normal)
        friendFollowBtn.setTitle("Unfollow", for: .normal)
        friendFollowBtn.addTarget(self, action:#selector(setBtnFollow), for: .touchUpInside)
    }
    
    // Sets the button to "Follow" (user is not following friend yet)
    @objc func setBtnFollow() {
        friendFollowBtn.layer.cornerRadius = 2
        friendFollowBtn.layer.borderWidth = 1
        friendFollowBtn.layer.borderColor = hexStringToUIColor(hex: "#00CCB3").cgColor
        friendFollowBtn.setTitleColor(hexStringToUIColor(hex: "#00CCB3"), for: .normal)
        friendFollowBtn.setTitle("Follow", for: .normal)
        friendFollowBtn.addTarget(self, action:#selector(setBtnUnfollow), for: .touchUpInside)
    }

}
