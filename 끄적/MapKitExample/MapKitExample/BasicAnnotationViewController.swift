//
//  BasicAnnotationViewController.swift
//  MapKitExample
//
//  Created by giftbot on 2018. 7. 13..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit
import MapKit

final class BasicAnnotationViewController: UIViewController {
  
  @IBOutlet private weak var mapView: MKMapView!
  var index = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    let center = CLLocationCoordinate2DMake(37.566308, 126.977948)
    
    // Span 단위는 1도
    // 위도 1도는 약 111킬로미터. 경도 1도는 위도에 따라 변함. 적도 약 111킬로미터 ~ 극지방 0)
    let span = MKCoordinateSpanMake(0.1, 0.1)
    let region = MKCoordinateRegionMake(center, span)//중심 좌표(center)로부터, 범위(span)
    mapView.setRegion(region, animated: true)
  }
  
  @IBAction private func addAnnotation(_ sender: Any) {
    /*
    let cityHall = MKPointAnnotation()
    cityHall.coordinate = CLLocationCoordinate2D(latitude: 37.566308, longitude: 126.977948)//coordinate - 필수 입력
    cityHall.title = "시청"//옵셔널 사항
    cityHall.subtitle = "서울특별시"//옵셔널 사항
    mapView.addAnnotation(cityHall)
    
    let namsan = MKPointAnnotation()
    namsan.title = "남산"
    namsan.coordinate = CLLocationCoordinate2D(latitude: 37.551416, longitude: 126.988194)
    mapView.addAnnotation(namsan)

    let gimpoAirport = MKPointAnnotation()
    gimpoAirport.coordinate = CLLocationCoordinate2D(latitude: 37.559670, longitude: 126.794320)
    gimpoAirport.title = "김포공항"
    mapView.addAnnotation(gimpoAirport)
    */
    
    let house = MKPointAnnotation()
    house.coordinate = CLLocationCoordinate2D(latitude: 37.543146, longitude: 127.068084)
    house.title = "바퀴벌레촌"
    mapView.addAnnotation(house)
    
    let fastCam = MKPointAnnotation()
    fastCam.coordinate = CLLocationCoordinate2D(latitude:37.545500, longitude: 127.057045)
    fastCam.title = "제강 공부방"
    mapView.addAnnotation(fastCam)
    
    //제스쳐로 해당부분 클릭하면 위경도 표시되게 해보기
  }
  
  
  @IBAction private func moveToRandomPin(_ sender: Any) {
    guard mapView.annotations.count > 0 else { return }
    let random = Int(arc4random_uniform(UInt32(mapView.annotations.count)))
    let annotation = mapView.annotations[random]
    let center = CLLocationCoordinate2D(latitude: annotation.coordinate.latitude, longitude: annotation.coordinate.longitude)
    let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    let region = MKCoordinateRegion(center: center, span: span)
    mapView.setRegion(region, animated: true)
  }
  
  @IBAction private func removeAnnotation(_ sender: Any) {
    mapView.removeAnnotations(mapView.annotations)
  }
  
  @IBAction private func setupCamera(_ sender: Any) {
    let camera = MKMapCamera()
    camera.centerCoordinate = CLLocationCoordinate2D(latitude: 37.551416, longitude: 126.988194)
    // 고도 (미터 단위)
    camera.altitude = 200
    // 카메라 각도 (0일 때 수직으로 내려다보는 형태)
    camera.pitch = 70.0
    mapView.setCamera(camera, animated: true)
  }
}
