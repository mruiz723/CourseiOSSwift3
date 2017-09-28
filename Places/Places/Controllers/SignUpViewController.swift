//
//  SignUpViewController.swift
//  Places
//
//  Created by Marlon David Ruiz Arroyave on 9/23/17.
//  Copyright © 2017 Eafit. All rights reserved.
//

import UIKit
import SVProgressHUD

class SignUpViewController: BaseViewController {

    // MARK: - Properties
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    
    // MARK: - IBActions
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func done(_ sender: Any) {
        if !(usernameTextField.text?.isEmpty)! && !(passwordTextField.text?.isEmpty)! && (repeatPasswordTextField.text! == passwordTextField.text!) {
            SVProgressHUD.show()
            let user = User(username: usernameTextField.text!, password: passwordTextField.text!)
            user.signUp(completion: { (success, users) in
                SVProgressHUD.dismiss()
                if success {
                    if let mainVC = self.slideMenuController()?.leftViewController as? LeftMenuViewController {
                        mainVC.data = mainVC.menuLogout
                        mainVC.menuTableView.reloadData()
                    }
                    self.performSegue(withIdentifier: "Places", sender: user)
                }
            })
        }
    }
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
