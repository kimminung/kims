//
//  CalloutActionViewController.swift
//  MapKitExample
//
//  Created by 김민웅 on 2018. 7. 13..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import Foundation
import MapKit
import SafariServices
import UIKit

final class MuseumInfo: MKPointAnnotation {
    var exhibition : [String]!
    var phoneNumber : String!
    var url : URL!
}

final class CalloutActionViewController : UIViewController {
//코드를 통해 연결할 때 스토리보드의 이 뷰컨트롤을 연결하고 속성 인셉터에서 탑
    
    @IBOutlet private weak var mapView : MKMapView!
    let museumAnnotationID = "kMuseumAnnotationViewIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setRegionToSeoul()
        addMuseumAnnotations()
    }
    
    func setRegionToSeoul() {
        let center = CLLocationCoordinate2DMake(37.5514, 126.9880)
        let span = MKCoordinateSpanMake(0.1, 0.1)
        let region = MKCoordinateRegionMake(center, span)
        mapView.setRegion(region, animated: true)
    }
    

    func addMuseumAnnotations() {
        let museum1 = MuseumInfo()
        museum1.title = "국립중앙박물관"
        museum1.coordinate = CLLocationCoordinate2DMake(37.523984, 126.980355)
        museum1.phoneNumber = "02-2077-9000"
        museum1.exhibition = ["고려 건국 1100주년", "김","민"]
        museum1.url = URL(string: "http://www.museum.go.kr")!
        
        let museum2 = MuseumInfo()
        museum2.title = "국aa"
        museum2.coordinate = CLLocationCoordinate2DMake(37.572618, 126.975203)
        museum2.phoneNumber = "02-aa"
        museum2.exhibition = ["고려 aaaa", "aaa","aa"]
        museum2.url = URL(string: "http://www.sejongpac.or.kr")!
        
        mapView.addAnnotations([museum1, museum2])//addAnnotation는 뷰가 아닌 정보를 나타냄
    }
    
    
}

extension CalloutActionViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MuseumInfo {
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: museumAnnotationID)
            if annotationView == nil {
                annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: museumAnnotationID)
            } else {
                annotationView?.annotation = annotation
            }
            annotationView!.image = UIImage(named: "museum")
            annotationView!.canShowCallout = true
            
            let addButton = UIButton(type: UIButtonType.contactAdd)
            addButton.tag = 0
            annotationView!.leftCalloutAccessoryView = addButton
            
            let infoButton = UIButton(type: UIButtonType.infoDark)
            infoButton.tag = 1
            annotationView!.rightCalloutAccessoryView = infoButton
            return annotationView
        }
        return MKAnnotationView(frame: .zero)
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard let annotation = view.annotation as? MuseumInfo else {return}
        print("Annotation Info: \(annotation.title ?? ""), \(annotation.exhibition), \(annotation.phoneNumber)")
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let museum = view.annotation as? MuseumInfo else {return}
        print("title: \(museum.title ?? ""), tag :", control.tag)
        
        let safariVC = SFSafariViewController(url: museum.url)
        present(safariVC, animated: true)
    }
}
