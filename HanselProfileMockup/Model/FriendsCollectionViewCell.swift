//
//  FriendsCollectionViewCell.swift
//  HanselProfileMockup
//
//  Created by Paolo Dobrowolny on 11/29/18.
//  Copyright © 2018 Hansel. All rights reserved.
//

import UIKit

// Defines properties of a Friend in the bottom profile section. Used to populate friends entries
struct Friend {
    let name : String
    let handle : String
    let followed : Bool
    let imgStr : String
}


class FriendsCollectionViewCell: UICollectionViewCell, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var friendsTableView: UITableView!

    // Set to a fixed value from excercise. Would be set by a call to the backend on a full app implementation
    var userFriends = [Friend]()
    
    override func awakeFromNib() {
        loadFriends()
        friendsTableView.reloadData()
    }
    
    // Loads user's friends
    func loadFriends() {
        userFriends = [
            Friend(name:"Landon Clark", handle:"landon", followed: false, imgStr: "landon"),
            Friend(name:"Felix Hamilton", handle:"felix", followed: true, imgStr: "felix"),
            Friend(name:"Josh Ranger", handle:"josh_24", followed: true, imgStr: "josh_24"),
            Friend(name:"Niki McDuffie", handle:"Duffie", followed: true, imgStr: "Duffie"),
            Friend(name:"Elisa Finch", handle:"efinch", followed: true, imgStr: "efinch")
        ]
    }
    
    
    // TableView has only 1 section
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // TableView has rows equal to the number of friends loaded by the app (5 in the excercise)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userFriends.count
    }
    
    // Cells are custom FriendTableViewCell cells whose values are set by the struct Friends defined above
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // uses the identifier set in interface builder
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "FriendTableViewCell",
            for: indexPath)  as UITableViewCell
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        
        guard let friendCell = cell as? FriendTableViewCell else {
            return cell
        }
        
        friendCell.configureCell(friend: userFriends[indexPath.row])
        
        return friendCell
    }
}
