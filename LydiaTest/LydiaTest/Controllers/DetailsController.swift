//
//  DetailsController.swift
//  LydiaTest
//
//  Created by Bérangère La Touche on 27/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class DetailsController: UIViewController {
    
    let detailsView: DetailsView = {
        let view = DetailsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var isConnected = false
    
    let regionRadius: CLLocationDistance = 100000
    
    var user: UserViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isConnected = Reachability.isConnectedToNetwork()
        setView()
        setData()
    }
    
    private func setData() {
        guard user != nil else {
            return
        }
        
        if (!isConnected) {
            let alert = ErrorMessage().showError(msg: "Some data can't be reach without connectivity")
            present(alert, animated: true, completion: nil)
        }
                
        detailsView.userImage.downloaded(from: user.picture(.large))
        detailsView.titleLabel.text = user.title
        detailsView.genderImage.image = user.genderImage
        detailsView.nameLabel.text = user.completeName
        detailsView.dob.label.text = user.birthday
        detailsView.cityLabel.label.text = user.city
        detailsView.emailLabel.imageLabel.label.text = user.email
        detailsView.cellLabel.imageLabel.label.text = user.cell
        detailsView.phoneLabel.imageLabel.label.text = user.phone
        detailsView.usernameLabel.imageLabel.label.text = user.username
        detailsView.addressLabel.imageLabel.label.text = user.address
        detailsView.passwordTextField.textField.text = user.password
        
        setMapView(coord: user.coordinates, cityName: user.city)
    }
    
    @objc func passwordHandler(sender: UIButton) {
        print("test")
    }    

    func setMapView(coord: Coordinates, cityName: String) {
        let lat = Double(coord.latitude)
        let lon = Double(coord.longitude)

        let location = CLLocation(latitude: lat!,
                                  longitude: lon!)
        centerMapOnLocation(location: location)
        
        let annotation = Annotation(title: cityName,
                                    coordinate: CLLocationCoordinate2D(latitude: lat!,
                                                                       longitude: lon!))
        detailsView.mapView.addAnnotation(annotation)
    }
    
    /// Zoom the map on the location specified
    /// - Parameter location: CLLocation - the coordinate of the place
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                  latitudinalMeters: regionRadius,
                                                  longitudinalMeters: regionRadius)
        detailsView.mapView.setRegion(coordinateRegion, animated: true)
    }
    
    private func setView() {
        self.navigationItem.titleView = detailsView.navBarTitle
        self.navigationController?.navigationBar.tintColor = .black
        
        view.addSubview(detailsView)
        detailsView
            .topAnchor
            .constraint(equalTo: view.topAnchor)
            .isActive = true
        detailsView
            .bottomAnchor
            .constraint(equalTo: view.bottomAnchor)
            .isActive = true
        detailsView
            .leadingAnchor
            .constraint(equalTo: view.leadingAnchor)
            .isActive = true
        detailsView
            .trailingAnchor
            .constraint(equalTo: view.trailingAnchor)
            .isActive = true
    }
    
    override func viewDidLayoutSubviews() {
      super.viewDidLayoutSubviews()
        detailsView.userImage.rounded()
        detailsView.dob.label.sizeToFit()
        detailsView.dob.label.layoutIfNeeded()
        detailsView.cityLabel.label.sizeToFit()
        detailsView.cityLabel.label.layoutIfNeeded()
    }
    
}
