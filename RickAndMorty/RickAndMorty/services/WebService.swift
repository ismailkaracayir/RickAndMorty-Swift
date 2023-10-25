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

    
    init() {
        allLocation()
    }
    func locationCharacterList (idList : [Int]){
        print("locationCharacterList ")
        var idString = "https://rickandmortyapi.com/api/character/"
        for item in idList {
            idString = idString + String(item) + ","
        }
        AF.request(idString,method:.get).response {
            response in
            if let error = response.error {
                print(" request error : \(error)")
            }
         
            if let data = response.data {
                do {
                    print("1")
                    let response = try JSONDecoder().decode([Character].self, from: data)
                    self.characterList.onNext(response)
                  
                } catch let error {
                  print(error)
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
