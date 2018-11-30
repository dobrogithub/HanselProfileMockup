//
//  HanselProfileVC.swift
//  HanselProfileMockup
//
//  Created by Paolo Dobrowolny on 11/28/18.
//  Copyright © 2018 Hansel. All rights reserved.
//

import UIKit

class HanselProfileVC: UIViewController {
    
    // Controls the bottom section between Places, Favorites and Friends
    @IBOutlet weak var collectionView: UICollectionView!
    
    // Navigation bottons used to switch between sections in the bottom part of the screen
    @IBOutlet weak var placesNavButton: UIButton!
    @IBOutlet weak var favoritesNavButton: UIButton!
    @IBOutlet weak var friendsNavButton: UIButton!
    @IBOutlet weak var navButtonsStack: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Called after the view has been presented and has adapted to the screen size. It adjusts the last UI elements programmatically
    override func viewDidAppear(_ animated: Bool) {
        // Adds circles to navigation buttons
        addCircleToNavButtons()
        
        // Starts from Places section
        setNavButtonSelected(placesNavButton)
    }
    
    // Adds to the navigation buttons a subview with the circle colored or grey
    func addCircleToNavButtons() {
        // Calculates center of and height of buttons (can change with screen size)
        let circleXpos = placesNavButton.frame.size.width/2.0 - 5
        let circleYpos = placesNavButton.frame.size.height - 10
        
        for button in navButtonsStack.subviews {
            let navCircle = UIView(frame: CGRect(x: circleXpos, y: circleYpos, width: 10, height: 10))
            navCircle.layer.cornerRadius = navCircle.frame.size.width/2.0;
            navCircle.backgroundColor = hexStringToUIColor(hex: "#EAEAEA")
            
            // Uses this tag (just a ref number) to point directly to the added circle in setNavButtonSelected:
            navCircle.tag = 123
            button.addSubview(navCircle)
        }
    }
    
    // Changes the color of text and circle in the navigator buttons (Places, Favorites, Friends)
    func setNavButtonSelected (_ navButton: UIButton) {

        for button in navButtonsStack.subviews as! [UIButton] {
            if (button == navButton) {
                //Changes font color to dark grey - button selected
                button.setTitleColor(hexStringToUIColor(hex: "#2D3A4B"), for: .normal)
                //Changes circle color to hansel color (points the circle using tag)
                button.viewWithTag(123)?.backgroundColor = hexStringToUIColor(hex: "#00CCB3")
            }
            else {
                //Changes font color to grey - unselected
                button.setTitleColor(hexStringToUIColor(hex: "#B5B5B5"), for: .normal)
                //Changes circle color to grey - unselected (points the circle using tag)
                button.viewWithTag(123)?.backgroundColor = hexStringToUIColor(hex: "#EAEAEA")
            }
        }
    }
    
    // Called when tapping on the 3 navigation buttons for the bottom section (Places, Favorites, Friends)
    @IBAction func showSection(sender: UIButton) {
        
        setNavButtonSelected(sender)
        
        if (sender == friendsNavButton) {
            let friendsItemIndexPath = IndexPath(item: 2, section: 0)
            switchToCell(friendsItemIndexPath)
        }
        else if (sender == favoritesNavButton) {
            let favsItemIndexPath = IndexPath(item: 1, section: 0)
            switchToCell(favsItemIndexPath)
        }
        else {
            let placesItemIndexPath = IndexPath(item: 0, section: 0)
            switchToCell(placesItemIndexPath)
        }
    }
    
    // Changes the bottom section to the one specified at the variable index. Adds Dissolve + EaseOut animation
    func switchToCell(_ index: IndexPath) {
        // Fades out the current visible cell
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseOut, animations: {
            
            self.collectionView.alpha = 0.0

        }, completion: { (finished: Bool) in
            
            // After the current cell is invisible switches to the new one
            self.collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: false)

            // Fades in the new visible cell
            UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {

                self.collectionView.alpha = 1.0
            })
        })
    }

}

extension HanselProfileVC: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // 3 sections for Places, Favorites, Friends
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    // Uses a different custom UICollectionViewCell for each of the 3 available sections
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if (indexPath.item == 2) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyFriendsCell", for: indexPath)
            return cell
        }
        else if (indexPath.item == 1) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyFavoritesCell", for: indexPath)
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyPlacesCell", for: indexPath)
            return cell
        }
    }
}

extension HanselProfileVC: UICollectionViewDelegateFlowLayout {

    // Adapts the size of the cells to the size of the screen dynamically
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.collectionView.frame.width, height: self.collectionView.frame.height)
    }
}



