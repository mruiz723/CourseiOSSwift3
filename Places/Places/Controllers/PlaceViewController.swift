//
//  PlaceViewController.swift
//  Places
//
//  Created by Marlon David Ruiz Arroyave on 9/23/17.
//  Copyright © 2017 Eafit. All rights reserved.
//

import UIKit
import MapKit

protocol PlaceViewControllerDelegate {
    func removePlace(place: Place)
}

class PlaceViewController: BaseViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var placeImageView: UIImageView!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var placeMapView: MKMapView!
    
    
    // MARK: - Properties
    var place: Place!
    var delegate: PlaceViewControllerDelegate?

    // MARK: - IBActions
    @IBAction func deletePlace(_ sender: Any) {
        let yesAction = UIAlertAction(title: "YES", style: .destructive) { (action) in
            self.place.deletePlace(completion: { (success, data) in
                if success {
                    self.delegate?.removePlace(place: self.place)
                   _ = self.navigationController?.popViewController(animated: true)
                }
            })
        }
        
        let noAction = UIAlertAction(title: "NO", style: .default, handler: nil)
        makeAlert(title: "Place", message: "Are you sure to delete this place?", actions: [noAction, yesAction])
        
    }
    
    
    // MARK: - LifeCylce
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        dateLabel.text = place.date
        if let _ = place.placeImage, let image = UIImage(named: place.placeImage!) {
            placeImageView.image = image
        }
        descriptionTextView.text = place.descriptionPlace
        
        showMap()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Utils
    func showMap() {
        let location = CLLocation(latitude: (place.coordinate?.latitude)!,     longitude: (place.coordinate?.longuitude)!)
        let regionRadius: CLLocationDistance = 1000
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius, regionRadius)
        placeMapView.setRegion(coordinateRegion, animated: true)
    }

}
