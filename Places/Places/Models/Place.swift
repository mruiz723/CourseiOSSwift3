//
//  Place.swift
//  Places
//
//  Created by Marlon David Ruiz Arroyave on 9/29/17.
//  Copyright © 2017 Eafit. All rights reserved.
//

import Foundation
import SwiftyJSON

class Place: NSObject {
    
    // MARK: - Propierties
    var idPlace: String?
    var title: String?
    var placeImage: String?
    var descriptionPlace: String?
    var date: String?
    var coordinate: Coordinate?
    
    
    
    // MARK: - Init
    // Designated initializer
    init(idPlace: String, title: String, placeImage: String, descriptionPlace: String, date: String, coordinate: Coordinate) {
        super.init()
        self.idPlace = idPlace
        self.title = title
        self.placeImage = placeImage
        self.descriptionPlace = descriptionPlace
        self.date = date
        self.coordinate = coordinate
    }
    
    convenience override init() {
        self.init(idPlace:"", title: "", placeImage: "", descriptionPlace: "", date: "", coordinate: Coordinate())
    }
    
    convenience init(title: String, descriptionPlace: String, date: String, coordinate: Coordinate) {
        self.init(idPlace:"", title: title, placeImage: "", descriptionPlace: "", date: "", coordinate: coordinate)
    }
    
    convenience init(title: String, placeImage: String, descriptionPlace: String, date: String, coordinate: Coordinate) {
        self.init(idPlace:"", title: title, placeImage: placeImage, descriptionPlace: descriptionPlace, date: date, coordinate: coordinate)
    }
    
    // MARK: - Utils
    
    class func places(completion: @escaping CompletionHandler) {
        Service.places { (success, data) in
            if success {
                var places = [Place]()
                if let response = data as? JSON {
                    if let dataArray = response.array {
                        for item in dataArray {
                            let place = Place(idPlace: item["_id"].string!, title: item["title"].string!, placeImage: item["placeImage"].string!, descriptionPlace: item["descriptionPlace"].string!, date: item["date"].string!, coordinate: Coordinate(lat: item["lat"].double!, long: item["long"].double!))
                            places.append(place)
                        }
                    }
                }
                completion(true, places)
            } else {
                completion(false, data)
            }
        }
    }
    
    func createPlace(completion: @escaping CompletionHandler) {
        Service.createPlace(parameters: toDictionary()) { (success, data) in
            if success {
                let item = data as! JSON
                if item["error"].exists() {
                    completion(success, item["error"].string!)
                } else {
                    let place = Place(idPlace: item["_id"].string!, title: item["title"].string!, placeImage: item["placeImage"].string!, descriptionPlace: item["descriptionPlace"].string!, date: item["date"].string!, coordinate: Coordinate(lat: item["lat"].double!, long: item["long"].double!))
                    completion(success, place)
                }
                
                
            } else {
                completion(success, data)
            }
        }
    }
    
    func updatePlace(completion: @escaping CompletionHandler) {
        let id = "/" + idPlace!
        Service.updatePlace(id: id, parameters: toDictionary()) { (success, data) in
            completion(success, data)
        }
    }
    
    func deletePlace(completion: @escaping CompletionHandler) {
        let id = "/" + idPlace!
        Service.deletePlace(id: id) { (success, data) in
            completion(success, data)
        }
    }
    
    func toDictionary() -> [String: AnyObject] {
        
//        "long": self.coordinate?.longuitude as AnyObject,
//        "lat": self.coordinate?.latitude as AnyObject
        
        let dict: [String: AnyObject] = [
            "title": self.title! as AnyObject,
            "placeImage": self.placeImage! as AnyObject,
            "descriptionPlace": self.descriptionPlace! as AnyObject,
            "date": self.date! as AnyObject,
            "long": String(format:"%f",(self.coordinate?.longuitude)!) as AnyObject,
            "lat":  String(format:"%f",(self.coordinate?.latitude)!) as AnyObject
            ]
        
        return dict
        
    }
}

struct Coordinate {
    
    var latitude: Double
    var longuitude: Double

    init(lat: Double, long: Double) {
        latitude = lat
        longuitude = long
    }
    
    init() {
        self.init(lat: 0.00, long: 0.00)
    }
}
