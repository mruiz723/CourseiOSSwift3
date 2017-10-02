//
//  PlacesViewController.swift
//  Places
//
//  Created by Marlon David Ruiz Arroyave on 9/23/17.
//  Copyright © 2017 Eafit. All rights reserved.
//

import UIKit
import SVProgressHUD

class PlacesViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource, PlaceViewControllerDelegate, NewPlaceViewControllerDelegate {

    // MARK: - IBOutlets
    @IBOutlet weak var placesTableView: UITableView!
    
    // MARK: - Properties
    var places = [Place]()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        SVProgressHUD.show()
        Place.places { (success, data) in
            SVProgressHUD.dismiss()
            if success {
                if let arrayPlaces = data as? [Place] {
                    self.places = arrayPlaces
                    self.placesTableView.reloadData()
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let place = places[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PlacesCell", for: indexPath) as? PlacesCell {
            cell.dateLabel.text = place.date
            cell.titleLabel.text = place.title
            cell.placeImageView.image = UIImage(named: "menuLogo.png")
            
            return cell
        }
        
        return UITableViewCell()
    }
    

    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let place = places[indexPath.row]
        self.performSegue(withIdentifier: "place", sender: place)
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "place"  {
            if segue.destination is PlaceViewController {
                let placeVC = segue.destination as! PlaceViewController
                placeVC.place = sender as! Place
                placeVC.delegate = self
            }
        } else  if segue.identifier == "newPlace"{
            if segue.destination is NewPlaceViewController {
                let newPlaceVC = segue.destination as! NewPlaceViewController
                newPlaceVC.delegate = self
            }
            
        }
    }
    
    // MARK: - PlaceViewControllerDelegate
    func removePlace(place: Place) {
        if let index = places.index(of: place) {
            places.remove(at: index)
            placesTableView.reloadData()
        }
    }
    
    // MARK: - NewPlaceViewControllerDelegate
    func didCreatePlace(place: Place) {
        places.append(place)
        placesTableView.reloadData()
    }
}
