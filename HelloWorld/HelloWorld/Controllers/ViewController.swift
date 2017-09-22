//
//  ViewController.swift
//  HelloWorld
//
//  Created by Marlon David Ruiz Arroyave on 9/22/17.
//  Copyright © 2017 Eafit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var welcomeLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func sendName(_ sender: Any) {
        
        if (nameTextField.text?.characters.count)! > 0 {
            welcomeLabel.text = "Welcome \(nameTextField.text!)!!!"
            welcomeLabel.isHidden = false
            
        }else {
            welcomeLabel.isHidden = true
            
            let alertController = UIAlertController(title: "Error", message: "Debes digitar tu nombre", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
        }
        
        view.endEditing(true)
        
    }



}

