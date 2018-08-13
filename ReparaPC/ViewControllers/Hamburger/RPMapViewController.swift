//
//  RPMapViewController.swift
//  ReparaPC
//
//  Created by Javier Cervantes on 28/06/18.
//  Copyright © 2018 Oscod. All rights reserved.
//

import UIKit
import MapKit

class RPMapViewController: RPBaseViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var goToStoreBtn: UIButton!
    @IBOutlet weak var userLocationBtn: UIButton!
    @IBOutlet weak var storeLocationView: UIView!
    
    var storeLocation: CLLocationCoordinate2D!
    var locService: RPLocationService?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        goToStoreBtn.layer.cornerRadius = 30
        userLocationBtn.layer.cornerRadius = 30
        storeLocationView.layer.cornerRadius = 30
        setupNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.setupMapView()
    }
    
    private func setupNavigationBar() {
        self.titleBarNavigation = "Ubicación"
        self.showBackButon()
        self.navigationController?.isNavigationBarHidden = false
    }
    
    private func setupMapView() {
        mapView.delegate = self
        mapView.showsScale = true
        mapView.showsUserLocation = true
        storeLocation = CLLocationCoordinate2DMake(20.056771, -102.718363)
        setAnnotation()
    }
    
    private func setAnnotation() {
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: storeLocation, span: span)
        mapView.setRegion(region, animated: true)
        let annotation = MKPointAnnotation()
        annotation.coordinate = storeLocation
        annotation.title = "Repara PC"
        mapView.addAnnotation(annotation)
    }
    
    @IBAction func goToStorePressed(_ sender: Any) {
        if locService == nil {
            locService = RPLocationService()
            locService?.locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locService?.enableLocationManager()
        }
        let userLocation = locService?.locationManager.location?.coordinate
        
        let sourceItem = MKMapItem(placemark: MKPlacemark(coordinate: userLocation!))
        let destItem = MKMapItem(placemark: MKPlacemark(coordinate: storeLocation))
        
        let directionRequest = MKDirectionsRequest()
        directionRequest.source = sourceItem
        directionRequest.destination = destItem
        directionRequest.transportType = .automobile
        
        let directions = MKDirections(request: directionRequest)
        directions.calculate(completionHandler: {
            response, error in
            guard let response = response else {
                if let error = error {
                    print(error)
                }
                return
            }
            let route = response.routes[0]
            self.mapView.add(route.polyline, level: .aboveRoads)
            let rekt = route.polyline.boundingMapRect
            self.mapView.setRegion(MKCoordinateRegionForMapRect(rekt), animated: true)
        })
    }
    
    @IBAction func showMyLocationPressed(_ sender: Any) {
        let userLocation = mapView.userLocation
        let region = MKCoordinateRegionMakeWithDistance(userLocation.location?.coordinate ?? CLLocationCoordinate2D(), 1500, 1500)
        mapView.setRegion(region, animated: true)
    }
    
    @IBAction func showStoreLocationPressed(_ sender: Any) {
        let region = MKCoordinateRegionMakeWithDistance(storeLocation, 1500, 1500)
        mapView.setRegion(region, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.blue
        renderer.lineWidth = 5.0
        return renderer
    }
    
}

