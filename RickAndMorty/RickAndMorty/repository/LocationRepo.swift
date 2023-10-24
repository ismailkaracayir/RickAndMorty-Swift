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
    var service = WebService()
    
    init() {
        locationList = service.locationList
    }
    
    
    func allLocation(){
        service.allLocation()
    }

}
