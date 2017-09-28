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

class LoginViewController: BaseViewController {

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
                        if let _ = data as? [JSON] {
                            if let mainVC = self.slideMenuController()?.leftViewController as? LeftMenuViewController {
                                mainVC.data = mainVC.menuLogout
                                mainVC.menuTableView.reloadData()
                            }
                            self.performSegue(withIdentifier: "Places", sender: nil)
                        }else {
                            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                            self.makeAlert(title: "Login", message: data.first as! String, actions: [okAction])
                        }
                        
                    }else {
                        
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
