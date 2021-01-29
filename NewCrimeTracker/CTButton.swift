//
//  CTButton.swift
//  NewCrimeTracker
//
//  Created by Alphonso Sensley II on 3/8/20.
//  Copyright © 2020 Alphonso Sensley II. All rights reserved.
//

import UIKit

class CTButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame:frame)
        configure()
    }
    
    init(backgroundColor: UIColor, title: String) {
        super.init(frame:.zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        self.layer.cornerRadius = 10
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        titleLabel?.textColor = .white
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
