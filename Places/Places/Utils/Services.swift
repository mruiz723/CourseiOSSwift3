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

struct Service {
    
    static func signUp( parameters:[String: AnyObject], completion: @escaping CompletionHandler) {
        Alamofire.request(userUrl, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            switch response.result {
            case .success(let jsonValue):
                let response = JSON(jsonValue)
                completion(true, response)
            case .failure(let error):
                completion(false, [["error" : error.localizedDescription as AnyObject]])
//                    if let resData = swiftyJsonVar["contacts"].arrayObject {
//                        self.arrRes = resData as! [[String:AnyObject]]
//                }
            }
        }
    }
    
    static func signIn( parameters:[String: AnyObject], completion: @escaping CompletionHandler) {
        Alamofire.request(loginUrl, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            switch response.result {
            case .success(let jsonValue):
                let response = JSON(jsonValue)
                completion(true, response)
            case .failure(let error):
                completion(false, ["error" : error.localizedDescription as AnyObject])
            }
        }
    }
    
    static func signOut( parameters:[String: AnyObject], completion: @escaping CompletionHandler) {
        Alamofire.request(loginUrl, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            switch response.result {
            case .success(let jsonValue):
                let response = JSON(jsonValue)
                completion(true, response)
            case .failure(let error):
                completion(false, ["error" : error.localizedDescription as AnyObject])
            }
        }
    }
    
    static func createPlace( parameters:[String: AnyObject], completion: @escaping CompletionHandler) {
        Alamofire.request(placeUrl, method: .post, parameters:parameters, headers: headers).responseJSON { (response) in
            switch response.result {
            case .success(let jsonValue):
                let response = JSON(jsonValue)
                completion(true, response)
            case .failure(let error):
                completion(false, ["error" : error.localizedDescription as AnyObject])
            }
        }

    }
    
    static func places( completion: @escaping CompletionHandler) {
        Alamofire.request(placeUrl, method: .get, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            switch response.result {
            case .success(let jsonValue):
                let response = JSON(jsonValue)
                completion(true, response)
            case .failure(let error):
                completion(false, ["error" : error.localizedDescription as AnyObject])
            }
        }
    }
    
    static func updatePlace( id: String, parameters:[String: AnyObject], completion: @escaping CompletionHandler) {
        let updateUrl = placeUrl + id
        Alamofire.request(updateUrl, method: .put, parameters:parameters, headers: headers).responseJSON { (response) in
            switch response.result {
            case .success(let jsonValue):
                let response = JSON(jsonValue)
                completion(true, response)
            case .failure(let error):
                completion(false, ["error" : error.localizedDescription as AnyObject])
            }
        }
    }
    
    static func deletePlace( id: String, completion: @escaping CompletionHandler) {
        let deleteUrl = placeUrl + id
        Alamofire.request(deleteUrl, method: .delete, headers: headers).responseJSON { (response) in
            switch response.result {
            case .success(let jsonValue):
                let response = JSON(jsonValue)
                completion(true, response)
            case .failure(let error):
                completion(false, ["error" : error.localizedDescription as AnyObject])
            }
        }
    }
    
}
