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


extension MainVC : UICollectionViewDelegate,UICollectionViewDataSource,CollectionCell {
 
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return locationList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let locationItem = locationList[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "locationCell", for: indexPath) as! LocationCollectionViewCell
        cell.isUserInteractionEnabled = true
        cell.indexpath = indexPath
        cell.cellProtocol = self
        cell.locationBtn.layer.borderColor = UIColor.white.cgColor
        cell.locationBtn.layer.borderWidth = 1.5
        cell.locationBtn.layer.cornerRadius = 20
       
        cell.locationBtn.setTitle(locationItem.name, for: .normal)
   

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let locationItem = self.locationList[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "locationCell", for: indexPath) as! LocationCollectionViewCell
   
        print(locationItem.name!)


    }

    func btnClick(indexPath: IndexPath) {
        print("Btn tıklandı")
        print(indexPath.row)
    
        
    }
    
    
}
