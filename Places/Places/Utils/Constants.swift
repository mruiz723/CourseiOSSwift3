//
//  Constants.swift
//  Places
//
//  Created by Marlon David Ruiz Arroyave on 9/27/17.
//  Copyright © 2017 Eafit. All rights reserved.
//

import Foundation
import SwiftyJSON

// MARK: - Services
let baseURL = "https://baas.kinvey.com"

// "Content-Type": "application/x-www-form-urlencoded",
let headersUser = [
    "Authorization": "Basic a2lkX0hKSnF0Q1VpLTo5OTlkMTI1MDljYmE0NmYwOTE0MzMzOWZkMWZhYjE5OA==",
    "Content-Type": "application/json"
]

let headers = [
    "Authorization": "Basic a2lkX0hKSnF0Q1VpLTo2YWI3ZWJiMjhkYTY0YjA3YjM2MDM3MWY5Mjg1NGNiMw==",
    "Content-Type": "application/json"
]



let userUrl = baseURL + "/user/kid_HJJqtCUi-/"
let loginUrl = baseURL + "/user/kid_HJJqtCUi-/login"
let logoutUrl = baseURL + "/user/kid_HJJqtCUi-/_logout"
let placeUrl = baseURL + "/appdata/kid_HJJqtCUi-/places"

// MARK: - Typealias
typealias CompletionHandler = (_ success: Bool, _ response: Any) -> ()
