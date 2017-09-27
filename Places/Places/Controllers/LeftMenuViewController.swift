//
//  LeftMenuViewController.swift
//  Places
//
//  Created by Marlon David Ruiz Arroyave on 9/26/17.
//  Copyright © 2017 Eafit. All rights reserved.
//

import UIKit

class LeftMenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: - IBoutlets
    
    
    // MARK: - Properties
    let menuLogin = ["Sign In", "Sign Up"]
    let menuLogout = ["Places", "Favorites", "Sign Out"]
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.init(red: 51/255, green: 51/255, blue: 51/255, alpha: 1.0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuLogin.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = menuLogin[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell") {
            
            cell.backgroundColor = UIColor.clear
            cell.selectionStyle =   UITableViewCellSelectionStyle.none
            cell.accessoryType  =   UITableViewCellAccessoryType.none
            let attributeString = NSAttributedString(string: item, attributes: [NSForegroundColorAttributeName: UIColor.white])
            cell.textLabel?.attributedText = attributeString
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            if let mainViewController = storyboard?.instantiateViewController(withIdentifier: "PlacesNav") as? UINavigationController {
                if let slideMenuController = self.slideMenuController() {
                    slideMenuController.changeMainViewController(mainViewController, close: true)
                }
            }
            break
        case 1:
            if let mainViewController = storyboard?.instantiateViewController(withIdentifier: "SignUp") as? SignUpViewController {
                if let slideMenuController = self.slideMenuController() {
                    slideMenuController.mainViewController?.present(mainViewController, animated: true, completion: nil)
                    slideMenuController.closeLeft()
                }
            }
            break
        default:
            break
        }
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
