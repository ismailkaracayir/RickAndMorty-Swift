//
//  LocationRepo.swift
//  RickAndMorty
//
//  Created by ismail karaçayır on 22.10.2023.
//

import Foundation
import RxSwift
class LocationRepo {
    var locationList = BehaviorSubject<[Result]>(value:[Result]())
    var characterList = BehaviorSubject<[Character]>(value:[Character]())

    var service = WebService()
    
    init() {
        locationList = service.locationList
        characterList = service.characterList
    }
    
    
    func allLocation(){
        service.allLocation()
    }
    
    func locationCharacterList (idList : [Int]){
        service.locationCharacterList(idList: idList)
 
    }

}
