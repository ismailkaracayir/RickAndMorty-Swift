//
//  LocationViewModel.swift
//  RickAndMorty
//
//  Created by ismail karaçayır on 22.10.2023.
//

import Foundation
import Foundation
import RxSwift
class LocationViewModel{
    var locationList = BehaviorSubject<[Result]>(value:[Result]())
    var characterList = BehaviorSubject<[Character]>(value:[Character]())

    var repo = LocationRepo()
    
    init() {
        locationList = repo.locationList
        characterList = repo.characterList
    }
    
    
    func allLocation(){
        repo.allLocation()
    }
    
    func locationCharacterList (idList : [Int]){
        repo.locationCharacterList(idList: idList)
 
    }

}
