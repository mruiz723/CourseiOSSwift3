//
//  NewPlaceViewController.swift
//  Places
//
//  Created by Marlon David Ruiz Arroyave on 9/23/17.
//  Copyright © 2017 Eafit. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

protocol NewPlaceViewControllerDelegate {
    func didCreatePlace(place: Place)
}

class NewPlaceViewController: BaseViewController, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, CLLocationManagerDelegate {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var placeImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    // MARK: - Properties
    let imagePicker = UIImagePickerController()
    let locationManager = CLLocationManager()
    var lat: Double = 0.00
    var long: Double = 0.00
    var delegate: NewPlaceViewControllerDelegate?
    
    // MARK: - IBActions
    @IBAction func save(_ sender: Any) {
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        guard !(titleTextField.text?.isEmpty)! else {
            makeAlert(title: "New Place", message: "Required Title Field", actions: [okAction])
            return
        }
        guard (placeImageView.image != nil) else {
            makeAlert(title: "New Place", message: "Required image Field", actions: [okAction])
            return
        }
        guard !(descriptionTextView.text.isEmpty) else {
            makeAlert(title: "New Place", message: "Required description Field", actions: [okAction])
            return
        }
        
        let place = Place(title: titleTextField.text!, placeImage: "menuLogo", descriptionPlace: descriptionTextView.text, date: dateLabel.text!, coordinate: Coordinate(lat: lat, long: long))
        
        place.createPlace { (success, data) in
            if success {
                let okActionPopVC = UIAlertAction(title: "OK", style: .default, handler: { (action) in
                    _ = self.navigationController?.popViewController(animated: true)
                })
                if let newPlace = data as? Place {
                    self.delegate?.didCreatePlace(place: newPlace)
                    self.makeAlert(title: "New Place", message: "A new Place has been created successfully", actions: [okActionPopVC])
                } else {
                    if let message = data as? [String: AnyObject] {
                        self.makeAlert(title: "New Place", message: message["error"] as! String, actions: [okActionPopVC])
                    }
                }
                
            } else {
                self.makeAlert(title: "New Place", message: "Something went wrong. Please try again later.", actions: [okAction])
            }
        }
    }
    
    @IBAction func camera(_ sender: Any) {
        imagePicker.sourceType = UIImagePickerControllerSourceType.camera
        present(self.imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func photoLibrary(_ sender: Any) {
        imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        present(self.imagePicker, animated: true, completion: nil)

    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        dateLabel.text = formatter.string(from: date)
        
        descriptionTextView.textColor = UIColor.lightGray
        imagePicker.delegate = self
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
       
        if CLLocationManager.locationServicesEnabled() {
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestLocation()
//            locationManager.startUpdatingLocation()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UIImagePickerControllerDelegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            placeImageView.image = image
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        imagePicker.dismiss(animated: true, completion: nil)
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
    
    // MARK: - CLLocationManagerDelegate
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        lat = (manager.location?.coordinate.latitude)!
        long = (manager.location?.coordinate.longitude)!
        NSLog("Lat : %f  Long : %f", lat , long)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        NSLog("Error in location: %@", error.localizedDescription)
    }
    
    // MARK: - Utils
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
