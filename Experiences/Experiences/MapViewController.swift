//
//  MapViewController.swift
//  Experiences
//
//  Created by Karen Rodriguez on 5/8/20.
//  Copyright © 2020 Hector Ledesma. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    // MARK: - Properties
    let experienceController = ExperienceController()

    // MARK: - Outlets
    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        mapView.delegate = self
        mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: "ExperienceView")

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        experienceController.createExperience(title: "Testing", content: "Hello world", videoURL: nil, imageData: nil, audioURL: nil, geoTag: CLLocationCoordinate2D(latitude: CLLocationDegrees(floatLiteral: 40.68), longitude: CLLocationDegrees(floatLiteral: -73.99)))

        mapView.addAnnotations(experienceController.experiences)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func addButtonTapped(_ sender: Any) {
    }


}

// MARK: - Extensions

extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let experience = annotation as? Experience else {
            fatalError("Didn't conform to MKAnnotation properly")
        }

        guard let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "ExperienceView", for: experience) as? MKMarkerAnnotationView else {
            fatalError("Missing a registered map annotation")
        }

        annotationView.glyphImage = UIImage(named: "􀉛")
        annotationView.canShowCallout = true

        return annotationView
    }
}
