//
//  CTTableViewCell.swift
//  NewCrimeTracker
//
//  Created by Alphonso Sensley II on 3/14/20.
//  Copyright © 2020 Alphonso Sensley II. All rights reserved.
//

import UIKit

class CTTableViewCell: UITableViewCell {
    var crimeLabel = UILabel()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
