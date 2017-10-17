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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        return !(nameTextField.text?.isEmpty)!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is GreetingsViewController {
            let greetingsVC = segue.destination as! GreetingsViewController
            greetingsVC.names = nameTextField.text!
        }
    }


}

