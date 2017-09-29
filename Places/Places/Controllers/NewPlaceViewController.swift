hjkkjhk//
//  NewPlaceViewController.swift
//  Places
//
//  Created by Marlon David Ruiz Arroyave on 9/23/17.
//  Copyright © 2017 Eafit. All rights reserved.
//

import UIKit

class NewPlaceViewController: BaseViewController, UITextViewDelegate {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var placeImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    // MARK: - Properties
    
    // MARK: - IBActions
    @IBAction func save(_ sender: Any) {
        
    }
    
    @IBAction func camera(_ sender: Any) {
        
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        descriptionTextView.textColor = UIColor.lightGray
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UITextViewDelegate
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.white
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Deja un comentario de este momento!!!"
            textView.textColor = UIColor.lightGray
        }
    }
    
    // MARK: - Utils
    

}
