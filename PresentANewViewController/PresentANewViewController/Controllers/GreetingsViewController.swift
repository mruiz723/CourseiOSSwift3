//
//  GreetingsViewController.swift
//  PresentANewViewController
//
//  Created by Marlon David Ruiz Arroyave on 9/22/17.
//  Copyright © 2017 Eafit. All rights reserved.
//

import UIKit

class GreetingsViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var welcomeLabel: UILabel!
    
    // MARK: - Properties
    var names: String = ""
    
    // MARK: - IBActions
    @IBAction func goBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        welcomeLabel.text = names
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
