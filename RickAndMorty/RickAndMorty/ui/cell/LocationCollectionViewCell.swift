//
//  LocationCollectionViewCell.swift
//  RickAndMorty
//
//  Created by ismail karaçayır on 23.10.2023.
//

import UIKit

class LocationCollectionViewCell: UICollectionViewCell {
   
    @IBOutlet  var itemContendView: UIView!
    @IBOutlet weak var itemLabel: UILabel!
    
    override func layoutSubviews() {
        itemContendView.layer.borderWidth = 2
        itemContendView.layer.borderColor = UIColor.white.cgColor
        itemContendView.layer.cornerRadius = 20
       
    }
    
 
  
}


