//
//  LoginViewController.swift
//  HelloWorld
//
//  Created by Marlon David Ruiz Arroyave on 9/22/17.
//  Copyright © 2017 Eafit. All rights reserved.
//

import UIKit
import SwiftyJSON
import SVProgressHUD

class LoginViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
   
    // MARK: - Properties
    
    // MARK: - IBActions
    @IBAction func login(_ sender: Any) {
        if !(userTextField.text?.isEmpty)! {
            if !(passwordTextField.text?.isEmpty)! {
                SVProgressHUD.show()
                let user = User(username: userTextField.text!, password: passwordTextField.text!)
                user.signIn(completion: { (success, data) in
                    SVProgressHUD.dismiss()
                    if success {
                        if let _ = data as? JSON {
                            if let slideMenuController = self.slideMenuController() {
                                if let mainVC = self.storyboard?.instantiateViewController(withIdentifier: "PlacesNav") as? UINavigationController {
                                    slideMenuController.changeMainViewController(mainVC, close: true)
                                    if let menuVC = slideMenuController.leftViewController as? LeftMenuViewController {
                                        menuVC.data = menuVC.menuLogout
                                        menuVC.menuTableView.reloadData()
                                    }
                                }
                            }
                            
                        }else {
                            self.errorMessage(message: data as! String)
                        }
                        
                    }else {
                        if let message = data as? [String: Any] {
                              self.errorMessage(message: message["error"] as! String)
                        }
                    }
                })
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
    
    // MARK: - Utils
    func errorMessage(message: String) {
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        self.makeAlert(title: "Login", message: message, actions: [okAction])
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
