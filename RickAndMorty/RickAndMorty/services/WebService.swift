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
    var characterList = BehaviorSubject<[Character]>(value:[Character]())
    var characterIDs = [String]()

    
    init() {
        allLocation()
        locationCharacterList(idList: [1,2,3,4,5,6,7])
    }
    func locationCharacterList (idList : [Int]){
        var url = "https://rickandmortyapi.com/api/character/"
        print("locationCharacterList servis çalıştı")
        for item in idList {
         url = url + String(item) + ","
        }
        
     // url son karakteri silinmesi gerekiyor 
        AF.request(url,method: .post ).response {
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
