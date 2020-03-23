//
//  ViewController.swift
//  NewCrimeTracker
//
//  Created by Alphonso Sensley II on 3/8/20.
//  Copyright © 2020 Alphonso Sensley II. All rights reserved.
//

import UIKit
import CoreLocation


class MainViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
   
    //MARK:- Properties
    let manager = CLLocationManager()
    var city = String()
    let logoImage = UIImageView()
    let poweredByImage = UIImageView()
    let crimeTrackerButton = CTButton(backgroundColor: .systemGray, title: "Get Crime Data")
    var citySelection = UIPickerView()
    var switchChanged = false
    let myLocation = CLLocationCoordinate2D()
    
//MARK:- View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLogoImage()
        setupCrimeTrackerButton()
        setupPickerView()
        setupPoweredByImage()
       
    }
    
//MARK:-PickerView Methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
       }
       
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return AlamedaCountyCities.count
       }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return AlamedaCountyCities[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
         city = AlamedaCountyCities[row]
    }
    
//MARK:- Push Next ViewController
    @objc func pushCityVC() {
        
        //If city has a value, we assign city to the city variable in next viewController
        guard !city.isEmpty else {
               print("No City Selected")
               return}
           
           let cityVC = CityVC()
           cityVC.city = city
           navigationController?.pushViewController(cityVC, animated: true)
           
       }
    
//MARK:-Setup View Components
    func setupPickerView() {
        view.addSubview(citySelection)
        citySelection.translatesAutoresizingMaskIntoConstraints = false
        citySelection.delegate = self
        citySelection.dataSource = self
        NSLayoutConstraint.activate([
            citySelection.bottomAnchor.constraint(equalTo: crimeTrackerButton.topAnchor, constant: 10),
            citySelection.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            citySelection.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 10),
            citySelection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            citySelection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
])
        
    }
       
    
    func setupLogoImage() {
        view.addSubview(logoImage)
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.image = UIImage(named: "Icon")
       
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImage.heightAnchor.constraint(equalToConstant: 250),
            logoImage.widthAnchor.constraint(equalToConstant: 250)])
    }
    
    
    func setupCrimeTrackerButton() {
        view.addSubview(crimeTrackerButton)
        crimeTrackerButton.addTarget(self, action: #selector(pushCityVC), for: .touchUpInside)
        crimeTrackerButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            crimeTrackerButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            crimeTrackerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            crimeTrackerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            crimeTrackerButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupPoweredByImage() {
        view.addSubview(poweredByImage)
        poweredByImage.translatesAutoresizingMaskIntoConstraints = false
        poweredByImage.image = UIImage(named: "Image")
        NSLayoutConstraint.activate([
            poweredByImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            poweredByImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            poweredByImage.heightAnchor.constraint(equalToConstant: 50),
            poweredByImage.widthAnchor.constraint(equalToConstant: 250)])
    }
    
    
    func returnUserLocation() -> CLLocationCoordinate2D {
        let userLocation = manager.location!.coordinate
        return userLocation
    }


}

