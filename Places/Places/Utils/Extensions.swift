//
//  Extensions.swift
//  Places
//
//  Created by Marlon David Ruiz Arroyave on 9/28/17.
//  Copyright © 2017 Eafit. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func makeAlert(title: String, message: String, actions:[UIAlertAction]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for item in actions {
            alert.addAction(item)
        }
        self.present(alert, animated: true, completion: nil)
    }
}

