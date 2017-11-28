//
//  ViewController.swift
//  ChiPizzaLocations
//
//  Created by Steven Lipton on 11/3/17.
//  Copyright © 2017 Steven Lipton. All rights reserved.
//

import UIKit
import MapKit


class ViewController: UIViewController, MKMapViewDelegate {
    let pizzaAnnotations = PizzaAnnotations()
    let initialCoordinate = CLLocationCoordinate2DMake(41.9180474,-87.661767)
    @IBOutlet weak var mapView: MKMapView!
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        var annotationView = MKMarkerAnnotationView()
        guard let annotation = annotation as? PizzaAnnotation else {return nil}
        var identifier = ""
        var color = UIColor.red
        switch annotation.type{
        case .deepDish:
            identifier = "Deep Dish"
            color = .red
        case .potPie:
            identifier = "Pot pie"
            color = .black
        case .thin:
            identifier = "Thin crust"
            color = .blue
        }
        if let dequedView = mapView.dequeueReusableAnnotationView(
            withIdentifier: identifier)
            as? MKMarkerAnnotationView {
            annotationView = dequedView
        } else{
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        }
        annotationView.markerTintColor = color
        annotationView.glyphImage = UIImage(named: "pizza")
        annotationView.glyphTintColor = .yellow
        annotationView.clusteringIdentifier = identifier
        return annotationView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mapView.delegate = self
        //set intial region
        let initialregion = MKCoordinateRegion(center: initialCoordinate, span: MKCoordinateSpanMake(0.25, 0.25))
        mapView.setRegion(initialregion, animated: true)
        // add the annotations
        mapView.addAnnotations(pizzaAnnotations.restaurants)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

