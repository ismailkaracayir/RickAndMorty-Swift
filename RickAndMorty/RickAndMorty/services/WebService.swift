//
//  WebService.swift
//  RickAndMorty
//
//  Created by ismail karaçayır on 22.10.2023.
//

import Foundation
import Alamofire
import RxSwift

class WebService{
    
    var locationList = BehaviorSubject<[Result]>(value:[Result]())
    
    init() {
        allLocation()
    }
    
    func allLocation(){
        print("web servis çalıştı")
        AF.request("https://rickandmortyapi.com/api/location",method: .get).response {
            response in
            if let data = response.data {
                print("1")

                do{
                    let response = try JSONDecoder().decode(Welcome2.self, from: data)
                    if let list = response.results {
                        self.locationList.onNext(list)
                    }
                }catch{
                    print("hata oluştu")
                    print(error.localizedDescription)
                }
                
            }
        }
    }
    
}
