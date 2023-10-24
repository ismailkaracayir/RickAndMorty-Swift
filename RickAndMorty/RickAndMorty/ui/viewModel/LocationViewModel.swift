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
    var repo = LocationRepo()
    
    init() {
        locationList = repo.locationList
    }
    
    
    func allLocation(){
        repo.allLocation()
    }

}
