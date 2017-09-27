//
//  Services.swift
//  Places
//
//  Created by Marlon David Ruiz Arroyave on 9/26/17.
//  Copyright © 2017 Eafit. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

typealias CompletionHandler = (_ success: Bool, _ response: [JSON]) -> ()

struct Service {
    
    static let baseURL = "https://baas.kinvey.com"
    static let headers = [
        "Authorization": "Basic a2lkX0hKSnF0Q1VpLTo2YWI3ZWJiMjhkYTY0YjA3YjM2MDM3MWY5Mjg1NGNiMw==",
        "Content-Type": "application/x-www-form-urlencoded"
    ]
    
    static let urlUser = baseURL + "/user/kid_HJJqtCUi-"
    static let urlPlace = baseURL + "/appdata/kid_HJJqtCUi-/places"
    
    static func signUp( parameters:[String: AnyObject], completion: @escaping CompletionHandler) {
        Alamofire.request(urlUser, method:.post, headers: headers).responseJSON { (response) in
            switch response.result {
            case .success(let jsonValue):
                let response = JSON(jsonValue)
                completion(true, [response])
            case .failure(let error):
                completion(false, [["error" : error.localizedDescription as AnyObject]])
//                    if let resData = swiftyJsonVar["contacts"].arrayObject {
//                        self.arrRes = resData as! [[String:AnyObject]]
//                }
            }
        }
    }
    
    static func signIn( parameters:[String: AnyObject], completion: @escaping CompletionHandler) {
        
    }
    
    static func createPlace( parameters:[String: AnyObject], completion: @escaping CompletionHandler) {
        
    }
    
    static func updatePlace( updateID: String, parameters:[String: AnyObject], completion: @escaping CompletionHandler) {
        
    }
    
    static func deletePlace( updateID: String, parameters:[String: AnyObject], completion: @escaping CompletionHandler) {
        
    }
    
}
