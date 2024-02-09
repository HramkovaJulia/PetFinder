//
//  MapView.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 22.12.23.
//

import UIKit
import MapKit

class MapView: UIView {
    
    private let mapView = MKMapView()
    
    private let defaultZoomLevel: CLLocationDistance = 1000
    private let defaultLatitude: CLLocationDegrees
    private let defaultLongitude: CLLocationDegrees
    
    init(frame: CGRect, defaultLatitude: Double, defaultLongitude: Double) {
        self.defaultLatitude = CLLocationDegrees(defaultLatitude)
        self.defaultLongitude = CLLocationDegrees(defaultLongitude)
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.defaultLatitude = 53.887300
        self.defaultLongitude = 25.302362
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        setupMapView()
        addDefaultAnnotation()
        configureCamera()
    }
    
    private func setupMapView() {
        addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: topAnchor),
            mapView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func addDefaultAnnotation() {
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: defaultLatitude, longitude: defaultLongitude)
        let location = CLLocationCoordinate2D(latitude: defaultLatitude, longitude: defaultLongitude)
        let region = MKCoordinateRegion(center: location, latitudinalMeters: defaultZoomLevel, longitudinalMeters: defaultZoomLevel)
        mapView.setRegion(region, animated: true)
        mapView.addAnnotation(annotation)
    }
    
    private func configureCamera() {
        let cameraCenter = CLLocationCoordinate2D(latitude: defaultLatitude, longitude: defaultLongitude)
        let cameraBoundary = MKMapView.CameraBoundary(coordinateRegion: MKCoordinateRegion(center: cameraCenter, latitudinalMeters: defaultZoomLevel, longitudinalMeters: defaultZoomLevel))
        mapView.setCameraBoundary(cameraBoundary, animated: true)
        
        let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: defaultZoomLevel)
        mapView.setCameraZoomRange(zoomRange, animated: false)
        
        
    }
    
}

extension MapView {
    func centerMapOnLocation(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let region = MKCoordinateRegion(center: location, latitudinalMeters: defaultZoomLevel, longitudinalMeters: defaultZoomLevel)
        mapView.setRegion(region, animated: true)
    }
}
