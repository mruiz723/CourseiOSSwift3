//
//  User.swift
//  Places
//
//  Created by Marlon David Ruiz Arroyave on 9/27/17.
//  Copyright © 2017 Eafit. All rights reserved.
//

import Foundation
import SwiftyJSON

class User {
    
    // MARK: - Properties
    var idUser: String?
    var username: String?
    var password: String?
    
    // MARK: - Init
    // Initzializer designated
    init(idUser: String, username: String, password: String) {
        self.idUser = idUser
        self.username = username
        self.password = password
    }
    
    convenience init() {
        self.init(idUser: "", username: "", password: "")
    }
    
    convenience init(username: String, password: String) {
        self.init(idUser: "", username: username, password: password)
    }
    
    // MARK: - Utils
    func signUp( completion: @escaping CompletionHandler) {
        let parameters = toDictionary()
        Service.signUp(parameters: parameters) { (success, data) in
            completion(success, data)
        }
    }
    
    func signIn( completion: @escaping CompletionHandler) {
        let parameters = toDictionary()
        Service.signIn(parameters: parameters) { (success, data) in
            if success {
                if let response = data as? JSON {
                    if response["description"].exists() {
                        if let error = response["description"].string {
                            completion(success, ["error":error])
                        }
                        
                    }else {
                        completion(success, data)
                    }
                }
            } else {
                completion(success, data)
            }
        }
    }
    
    func toDictionary() -> [String: AnyObject] {
        
        let dict: [String: AnyObject] = [
            "username": self.username! as AnyObject,
            "password": self.password! as AnyObject,
        ]
        
        return dict
    }
}
