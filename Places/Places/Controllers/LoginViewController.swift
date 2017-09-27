//
//  LoginViewController.swift
//  HelloWorld
//
//  Created by Marlon David Ruiz Arroyave on 9/22/17.
//  Copyright © 2017 Eafit. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
   
    // MARK: - Properties
    let username = "mruiz"
    let password = "mruiz"
    
    
    // MARK: - IBActions
    @IBAction func login(_ sender: Any) {
        if !(userTextField.text?.isEmpty)! {
            if !(passwordTextField.text?.isEmpty)! {
                if userTextField.text == username && passwordTextField.text == password {
                    performSegue(withIdentifier: "Places", sender: nil)
                }
            }
        }
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Login"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
