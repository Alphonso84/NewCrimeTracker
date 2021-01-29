//
//  CityVC.swift
//  NewCrimeTracker
//
//  Created by Alphonso Sensley II on 3/9/20.
//  Copyright © 2020 Alphonso Sensley II. All rights reserved.
//

import UIKit
import MapKit


class CityVC: UIViewController, CLLocationManagerDelegate, UITableViewDelegate, UITableViewDataSource {
    
 //MARK:- PROPERTIES
    var city = String()
    let map = MKMapView()
    var tableView = UITableView()
    let cellId = "myCell"
    let rowHeight: CGFloat = 44
 
//MARK:- VIEW LIFECYCLE METHODS
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        //map.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        setupMapView()
        setupTableView()
        title = city
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.register(CTTableViewCell.self, forCellReuseIdentifier: cellId)
    }
    

//MARK:- MAP SETUP
    func setupMapView() {
        view.addSubview(map)
        map.delegate = self
        map.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            map.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            map.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            map.heightAnchor.constraint(equalToConstant: 350),
            map.widthAnchor.constraint(equalToConstant: 400)])
        
        let regionRadius: CLLocationDistance = 10000.0
        let region = MKCoordinateRegion(center: cityMapShouldShow().coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        map.setRegion(region, animated: true)
    }
    
    
    //MAP HELPER METHOD
    func cityMapShouldShow() ->CLLocation {
        var cityToZoomTo = CLLocation()
        
        switch city {
        case OAKLAND:
            cityToZoomTo = oakland
        case FREMONT:
            cityToZoomTo = fremont
        case HAYWARD:
            cityToZoomTo = hayward
        case BERKELEY:
            cityToZoomTo = berkeley
        case SANLEANDRO:
            cityToZoomTo = sanLeandro
        case LIVERMORE:
            cityToZoomTo = livermore
        case PLEASANTON:
            cityToZoomTo = pleasanton
        case ALAMEDA:
            cityToZoomTo = alameda
        case UNIONCITY:
            cityToZoomTo = unionCity
        case DUBLIN:
            cityToZoomTo = dublin
        case NEWARK:
            cityToZoomTo = newark
        case EMERYVILLE:
            cityToZoomTo = emeryville
        case PIEDMONT:
            cityToZoomTo = piedmont
        default:
            cityToZoomTo = oakland
        }
        
        return cityToZoomTo
    }
    
    
//MARK:- TABLEVIEW SETUP
    func setupTableView() {
        view.addSubview(tableView)
        tableView.rowHeight = 70
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: map.bottomAnchor, constant: 0),
            tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tableView.heightAnchor.constraint(equalToConstant: 350),
            tableView.widthAnchor.constraint(equalToConstant: 400)])
    }
    
    
//MARK:- TABLEVIEW DELEGATE METHODS
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! CTTableViewCell
        cell.textLabel?.text = "Hello"
        cell.textLabel?.textColor = UIColor.systemGray
        cell.imageView!.image = UIImage(named: "Court")
        cell.detailTextLabel?.text = "Test"
        cell.detailTextLabel?.textColor = UIColor.black
      
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHeight
    }
}


//MARK:- CLASS EXTENSIONS
extension CityVC: MKMapViewDelegate {
    
    func mapViewWillStartRenderingMap(_ mapView: MKMapView) {
        print("print Rendering Map")
    }
}
