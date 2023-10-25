//
//  CharacterCollectionViewCell.swift
//  RickAndMorty
//
//  Created by ismail karaçayır on 25.10.2023.
//

import UIKit

class CharacterCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var parentView: UIView!
    
    @IBOutlet weak var characterImageView: UIImageView!
    
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var genderLbl: UILabel!
}
