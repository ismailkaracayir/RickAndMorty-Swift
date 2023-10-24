//
//  ViewController.swift
//  RickAndMorty
//
//  Created by ismail karaçayır on 22.10.2023.
//

import UIKit

class MainVC: UIViewController {
    @IBOutlet var mainView: UIView!
    var viewModel = LocationViewModel()
    var locationList = [Result]()
    var characterIDs = [Int]()

    @IBOutlet weak var locationCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationCollectionView.dataSource = self
        locationCollectionView.delegate = self
        locationCollectionView.backgroundColor = UIColor.clear
        navigationItem.hidesBackButton = true
        _ = viewModel.locationList.subscribe(onNext: { locationList in
            self.locationList = locationList
            DispatchQueue.main.async {
                self.locationCollectionView.reloadData()
            }
        })
        
        
        
    }
    
    
    override func viewDidLayoutSubviews() {
        let theme = AppTheme(customView: mainView)
        let gradientLayer = theme.customGradient
        mainView.layer.insertSublayer(gradientLayer, at: 0)
   
        
    }


}

// oluşan buttonlar taşma sorunu oluyor  proje sonunda düzeltilmesi gerekiyor
extension MainVC : UICollectionViewDelegate,UICollectionViewDataSource {
 
    
   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return locationList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let locationItem = locationList[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "locationCell", for: indexPath) as! LocationCollectionViewCell
        print("oluştu")
        cell.isUserInteractionEnabled = true
        cell.itemLabel.text = locationItem.name
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCell:UICollectionViewCell = locationCollectionView.cellForItem(at: indexPath)!
        selectedCell.contentView.backgroundColor = UIColor(named: "customColor2")
        let selectedItem = locationList[indexPath.row]
        if let list = selectedItem.residents {
            for url in list {
                if let lastPathComponent = URL(string: url)?.lastPathComponent {
                     if let characterID = Int(lastPathComponent) {
                         characterIDs.append(characterID)
                        
                     }
                 }
            }
        }
        
      
        
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let selectedCell:UICollectionViewCell = locationCollectionView.cellForItem(at: indexPath)!
        selectedCell.contentView.backgroundColor = .clear

    }
 
 
    

    


 
    
    
}
