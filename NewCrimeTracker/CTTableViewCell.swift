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
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "myCell")
    }
    init(backgroundColor: UIColor, labelText: String) {
        super.init(style: .default, reuseIdentifier: "myCell")
        self.backgroundColor = backgroundColor
        self.crimeLabel.text = labelText
        self.addSubview(crimeLabel)
        NSLayoutConstraint.activate([
            crimeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            crimeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            crimeLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 5)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        
    }
   
    
   
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
