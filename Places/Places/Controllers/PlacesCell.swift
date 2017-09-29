//
//  PlacesCell.swift
//  Places
//
//  Created by Marlon David Ruiz Arroyave on 9/29/17.
//  Copyright © 2017 Eafit. All rights reserved.
//

import UIKit

class PlacesCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var placeImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    // MARK: - Properties
    
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
