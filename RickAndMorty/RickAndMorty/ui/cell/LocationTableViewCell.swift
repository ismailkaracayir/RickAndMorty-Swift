//
//  LocationTableViewCell.swift
//  RickAndMorty
//
//  Created by ismail karaçayır on 22.10.2023.
//

import UIKit

class LocationTableViewCell: UITableViewCell {

    @IBOutlet weak var itemButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func itemButtonClick(_ sender: Any) {
    }
}
