//
//  MyLocationViewController.swift
//  MapKitExample
//
//  Created by giftbot on 2018. 7. 13..
//  Copyright © 2018년 giftbot. All rights reserved.
//

//import는 ABC순으로 시스템 기준으로
//잡아주는게 기본
import CoreLocation
import MapKit
import UIKit

final class MyLocationViewController: UIViewController {
  
  @IBOutlet private weak var mapView: MKMapView!
    
  private let locationManager = CLLocationManager()//ARC로 적용되기 때문에 프로퍼티로 유지시켜줘야함
    //클래스 처음부터 끝까지 사용하게끔. //viewDidLoad에 넣으면 안된다
    
  override func viewDidLoad() {
    super.viewDidLoad()
//    mapView.mapType = .satellite
    mapView.showsUserLocation = true    //현재 내 위치 표시 true
    locationManager.delegate = self
    checkAuthorizationStatus()
  }
  
  
  private func checkAuthorizationStatus() {
    switch CLLocationManager.authorizationStatus() {
    case .notDetermined:
//        locationManager.requestWhenInUseAuthorization()
      locationManager.requestWhenInUseAuthorization()
    case .restricted, .denied:
      // Disable location features
      break
    case .authorizedWhenInUse:
      // Enable basic location features
      // enableMyWhenInUseFeatures()
      fallthrough
    case .authorizedAlways:
      // Enable any of your app's location features
      // enableMyAlwaysFeatures()
      startUpdatingLocation()
    }
  }
  
  private func startUpdatingLocation() {
    let status = CLLocationManager.authorizationStatus()
    
    //가용성, 권한 체크
    guard status == .authorizedAlways || status == .authorizedWhenInUse,
      CLLocationManager.locationServicesEnabled()
      else { return }
    //10미터를 이동할 때
    locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
    locationManager.distanceFilter = 10.0   //10미터보다 많이 이동했을때 위치를 이동
//    locationManager.desiredAccuracy = kCLLocationAccuracyBest
//    locationManager.distanceFilter = 0.0
    locationManager.startUpdatingLocation() //모니터링 시작
    //이 설정을 충족 시킬때부터 알림이 델리게이트의
    /*
                                                    //didUpdateLocations에 로케이션 업뎃정보
     func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
     let current = locations.last!
     if (abs(current.timestamp.timeIntervalSinceNow) < 10) {
     let coordinate = current.coordinate//
     let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
     let region = MKCoordinateRegion(center: coordinate, span: span)
     mapView.setRegion(region, animated: true)
     
     let annotation = Annotation(title: "MyLocation", coordinate: coordinate)
     if let anno = mapView.annotations.first {//여러번 호출되는 펑션인데 계속 퍼스트를 생성함..수정필요
     mapView.removeAnnotation(anno)
     }
     mapView.addAnnotation(annotation)
     }
     */
    //이 부분에 오게 되고 그때 알림이 처리되는것
  }
  
    //헤딩
  @IBAction private func mornitoringHeading(_ sender: Any) {
    guard CLLocationManager.headingAvailable() else { return }
    locationManager.startUpdatingHeading()
  }
  
  @IBAction private func stopMornitoring(_ sender: Any) {
    locationManager.stopUpdatingHeading()
  }
}


// MARK: - CLLocationManagerDelegate

extension MyLocationViewController: CLLocationManagerDelegate {
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    let current = locations.last!
    if (abs(current.timestamp.timeIntervalSinceNow) < 10) {
        //--------각 뷰의 반경을 표시하고 그 뷰의 맵뷰를 표시
      let coordinate = current.coordinate//좌표
      let span = MKCoordinateSpan(latitudeDelta: 0.0001, longitudeDelta: 0.0001)
      let region = MKCoordinateRegion(center: coordinate, span: span)
      mapView.setRegion(region, animated: true)
        //--------각 뷰의 반경을 표시하고 그 뷰의 맵뷰를 표시
      
        //
      let annotation = Annotation(title: "MyLocation", coordinate: coordinate)
      if let anno = mapView.annotations.first {//여러번 호출되는 펑션인데 계속 퍼스트를 생성함..수정필요
        mapView.removeAnnotation(anno)
      }
      mapView.addAnnotation(annotation)
    }
  }
  
  func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    print("\n---------- [ status ] ----------\n")
    print(status)
    
    switch status {
    case .authorizedWhenInUse, .authorizedAlways:
      print("Authorized")
    default:
      print("Unauthorized")
    }
  }
  
  func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    if let error = error as? CLError, error.code == .denied {
      // Location updates are not authorized.
      // Stop Requesting Location Service
      return
    }
    // Notify the user of any errors.
  }
  
  func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
    print("\n---------- [ didUpdateHeading ] ----------")
    print("trueHeading :", newHeading.trueHeading)
    print("magneticHeading :", newHeading.magneticHeading)
    print("values \(newHeading.x), \(newHeading.y), \(newHeading.z)")
  }
}



class Annotation: NSObject, MKAnnotation {
  var title: String?
  var coordinate: CLLocationCoordinate2D
  
  init(title: String, coordinate: CLLocationCoordinate2D) {
    self.title = title
    self.coordinate = coordinate
  }
}
