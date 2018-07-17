//
//  CalloutActionViewController.swift
//  MapKitExample
//
//  Created by Jo JANGHUI on 2018. 7. 13..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import MapKit
import SafariServices   // 아이폰에서 일반적으로 사용하는 사파리 앱을 호출할때 사용합니다.
import UIKit

// MKPointAnnotation으로 만들면 기본적인 정보만 넣을수 있는데, 더 넣기 위해서 커스텀해서 만드는 겁니다.
final class MuseumInfo: MKPointAnnotation {
    var exhibition: [String]!
    var phoneNumber: String!
    var url: URL!
}

class CalloutActionViewController: UIViewController {

    @IBOutlet private var mapView: MKMapView!
    let museumAnnotationID = "kMuseumAnnotationNNNViewIdentifier" // 어노테이션이 여러개가 생길겨서 지도를 볼때는 재사용을 해서 봐야 하른ㄴ데 그때 사용할 아이텐티입니다.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setRegionToSeoul()
        addMuseumAnnotations()
        // Do any additional setup after loading the view.
    }
    
    func setRegionToSeoul() {
        let center = CLLocationCoordinate2D(latitude: 37.5514, longitude: 126.9880)
        let span = MKCoordinateSpanMake(0.1, 0.1)
        let region = MKCoordinateRegionMake(center, span)
        mapView.setRegion(region, animated: true)
    }
    
    func addMuseumAnnotations() {
        // MuseumInfo을 이용해서 정보를 더 넣어줬습니다.
        let museum1 = MuseumInfo()
        museum1.title = "국립중앙박물관"
        museum1.coordinate = CLLocationCoordinate2D(latitude: 37.523984, longitude: 126.980355)
        museum1.phoneNumber = "02-2077-9000"
        museum1.exhibition = ["고려 건국 1100주년", "칸의 제국 몽골", "외규장각 의궤"]
        museum1.url = URL(string: "http://www.museum.go.kr")
        
        let museum2 = MuseumInfo()
        museum2.title = "세종문화회관"
        museum2.coordinate = CLLocationCoordinate2D(latitude: 37.572618, longitude: 126.975103)
        museum2.phoneNumber = "02-399-1000"
        museum2.exhibition = ["2018 그랜드 Summer 클래식", "사랑의 묘약"]
        museum2.url = URL(string: "http://www.sejongpac.or.kr")
        
        mapView.addAnnotations([museum1, museum2])  // addAnnotations는 정보를 가지고 있는거지 뷰를 실제로 나타내는건 아닙니다. //뷰를 나타내는건 델리게이트에서 나타냅니다.
    }

}


extension CalloutActionViewController: MKMapViewDelegate {
    
    // 어노테이션을 선택하면 동작하는 메소드
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard let annotation = view.annotation as? MuseumInfo else { return }
        print("Annotation Info: ]\(annotation.title ?? ""), \(annotation.exhibition), \(annotation.phoneNumber)")
    }
    
    // 어노테이션을 선택해서 나오는 설명창(?)을 눌렀을때 동작하는 메서드입니다.
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let museum = view.annotation as? MuseumInfo else { return }
        print("titleP: \(museum.title ?? ""), tag : ", control.tag)
        
        
        let safariVC = SFSafariViewController(url: museum.url)
        present(safariVC, animated: true)
    }
    
    // 어노테니션의 뷰를 담당합니다.
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MuseumInfo {
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: museumAnnotationID)  // 재사용
            
            if annotationView == nil {
                annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: museumAnnotationID)  // 없으면 생성
            } else {
                annotationView?.annotation = annotation // 있으면 그대로
            }
            
            annotationView!.image = UIImage(named: "museum")    // 에셋의 이미지를 기본 핀 이미지 대신 사용
            annotationView!.canShowCallout = true           //  말풍선 처럼 나오는 추가 설명을 사용할건지를 bool값으로
            
            // 왼쪽 버튼
            let addButton = UIButton(type: UIButtonType.contactAdd)
            addButton.tag = 0       // 어떤 버튼을 눌렀는지 구분해 주기 위해서 사용합니다.
            annotationView!.leftCalloutAccessoryView = addButton
            
            // 오른쪽 버튼
            let infoButton = UIButton(type: UIButtonType.infoDark)
            infoButton.tag = 1
            annotationView!.rightCalloutAccessoryView = infoButton
            return annotationView
        }
        return MKAnnotationView(frame: .zero)
    }
}
