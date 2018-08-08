//
//  MyMapTableViewCell.swift
//  FoodPin
//
//  Created by Euijoon Jung on 2018. 8. 3..
//  Copyright © 2018년 AppCoda. All rights reserved.
//

import UIKit
import MapKit

class MyMapTableViewCell: UITableViewCell {
    
    @IBOutlet weak var myMapView: MKMapView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configure(location: String) { // Get location
        let geoCoder = CLGeocoder()
        print(location)
        geoCoder.geocodeAddressString(location, completionHandler: { placemarks, error in
            if let error = error {
                print("error!!")
                print(error.localizedDescription)
                return
            }
            if let placemarks = placemarks { // Get the first placemark
                let placemark = placemarks[0]
                // Add annotation
                let annotation = MKPointAnnotation()
                if let location = placemark.location {
                    annotation.coordinate = location.coordinate
                    self.myMapView.addAnnotation(annotation)
                    // Set the zoom level
                    let region = MKCoordinateRegionMakeWithDistance(annotation.coordinate,250, 250)
                    self.myMapView.setRegion(region, animated: false)
                    
                }
            }
            
        })
    }
}

