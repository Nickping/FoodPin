//
//  MapViewController.swift
//  FoodPin
//
//  Created by Euijoon Jung on 2018. 8. 3..
//  Copyright © 2018년 AppCoda. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    var restaurant = Restaurant()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        mapView.showsCompass = true
        mapView.showsScale = true
        mapView.showsTraffic = true
        // Do any additional setup after loading the view.
        
        // Convert address to coordinate and annotate it on map
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(restaurant.location, completionHandler:
            { placemarks, error in
                if let error = error {
                    print("error in MapViewController")
                    print(error)
                    return }
                if let placemarks = placemarks { // Get the first placemark
                    let placemark = placemarks[0]
                    // Add annotation
                    let annotation = MKPointAnnotation()
                    annotation.title = self.restaurant.name
                    annotation.subtitle = self.restaurant.type
                    if let location = placemark.location { annotation.coordinate = location.coordinate
                        // Display the annotation
                        self.mapView.showAnnotations([annotation], animated: true)
                        self.mapView.selectAnnotation(annotation, animated: true)
                    } }
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        let identifier = "MyMarker"
        
        if annotation.isKind(of: MKUserLocation.self) {
            return nil
        }
        
        var annotationView : MKMarkerAnnotationView? = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView
        if annotationView == nil {
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        }
        
        annotationView?.glyphText = "🤡"
        annotationView?.markerTintColor = UIColor.orange
        
        return annotationView
    }
    
    
    
}
