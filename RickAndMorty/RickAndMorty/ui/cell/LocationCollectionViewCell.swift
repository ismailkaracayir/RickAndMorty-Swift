//
//  LocationCollectionViewCell.swift
//  RickAndMorty
//
//  Created by ismail karaçayır on 23.10.2023.
//

import UIKit
protocol CollectionCell{
    func btnClick (indexPath : IndexPath)
}
class LocationCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var locationBtn: UIButton!
    var indexpath : IndexPath?
    var cellProtocol : CollectionCell?
    
    @IBAction func locationBtnClick(_ sender: Any) {
        cellProtocol?.btnClick(indexPath: indexpath!)
        print("btn click oldu")
    }
    
 
}
