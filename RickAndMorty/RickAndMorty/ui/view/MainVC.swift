//
//  ViewController.swift
//  RickAndMorty
//
//  Created by ismail karaçayır on 22.10.2023.
//

import UIKit
import Kingfisher

class MainVC: UIViewController {
    @IBOutlet var mainView: UIView!
    var viewModel = LocationViewModel()
    var locationList = [Result]()
    var characterIDs = [Int]()
    var characterList = [Character]()
    @IBOutlet weak var charactercollectionView: UICollectionView!
    @IBOutlet weak var locationCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationCollectionView.dataSource = self
        locationCollectionView.delegate = self
        charactercollectionView.dataSource = self
        charactercollectionView.delegate = self
        locationCollectionView.backgroundColor = UIColor.clear
        charactercollectionView.backgroundColor = UIColor.clear
        // colectionview tasarım
        let collectionvewLayout = UICollectionViewFlowLayout()
        collectionvewLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        collectionvewLayout.minimumLineSpacing = 10
        collectionvewLayout.minimumInteritemSpacing = 10
        let screenWidth = UIScreen.main.bounds.width
        let itemGWidth = (screenWidth - 30)
        collectionvewLayout.itemSize = CGSize(width: itemGWidth, height: itemGWidth * 0.3)
        charactercollectionView.collectionViewLayout = collectionvewLayout

             

        navigationItem.hidesBackButton = true
        _ = viewModel.locationList.subscribe(onNext: { locationList in
            self.locationList = locationList
            DispatchQueue.main.async {
                self.locationCollectionView.reloadData()
            }
        })
        if characterIDs.isEmpty {
            for _ in 0..<10{
                var randomNum = Int.random(in: 1...10)
                characterIDs.append(randomNum)
            }
        }
        
        self.viewModel.locationCharacterList(idList: self.characterIDs)
        _ = viewModel.characterList.subscribe(onNext: { list in
            self.characterList = list
            DispatchQueue.main.async {
              // karakter listesi güncellenecek
                self.charactercollectionView.reloadData()
            }
        })
        self.characterIDs.removeAll()
        
        
        
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
        if collectionView  == locationCollectionView {
            return locationList.count
        }else{
            return characterList.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == locationCollectionView {
            let locationItem = locationList[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "locationCell", for: indexPath) as! LocationCollectionViewCell
            print("oluştu")
            cell.isUserInteractionEnabled = true
            cell.itemLabel.text = locationItem.name
            return cell
        }else{
            let characterItem = characterList[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "characterCell", for: indexPath) as! CharacterCollectionViewCell
            cell.nameLbl.text = characterItem.name ?? "no Name"
            cell.genderLbl.text = characterItem.gender ?? "no Gender"
            if let gender =  characterItem.gender{
                print("GELEN GENDER \(gender)")
                if gender == "Male"{
                    cell.parentView.backgroundColor = .systemPink
                }
               else  if gender == "Female"{
                    cell.parentView.backgroundColor = .systemBlue
                }else{
                    cell.parentView.backgroundColor = .systemGray
                }
                
            }
            if let url = URL(string: characterItem.image!) {
                DispatchQueue.main.async {
                    cell.characterImageView.kf.setImage(with: url)
                }
            }
      
            return cell
            
            }
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
                        
                     }}}}
  
        self.viewModel.locationCharacterList(idList: self.characterIDs)
        _ = viewModel.characterList.subscribe(onNext: { list in
            for item in list {
                print(item.name!)
            }
        })
        self.characterIDs.removeAll()
 
        
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let selectedCell:UICollectionViewCell = locationCollectionView.cellForItem(at: indexPath)!
        selectedCell.contentView.backgroundColor = .clear

    }
 
}



