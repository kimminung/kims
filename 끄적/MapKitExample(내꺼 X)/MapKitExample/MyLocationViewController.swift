//
//  MyLocationViewController.swift
//  MapKitExample
//
//  Created by giftbot on 2018. 7. 13..
//  Copyright © 2018년 giftbot. All rights reserved.
//

// import의 순서는 ABCD, 애플에서 제공하는 시스템 프레임 워크가 위로 올라가게 되고, 커스텀 라이브러리나 오픈소스는 그 아래로  적으면 됩니다
import CoreLocation     // 위치를 표현
import MapKit           // Map을 표현
import UIKit

final class MyLocationViewController: UIViewController {
  
  @IBOutlet private weak var mapView: MKMapView!
  private let locationManager = CLLocationManager() // coreLocation을 해야지만 메니져를 만들수 있ㅆ브니다.
    // CLLocationManager도 ARC적용이 되기 때문에 유지를 시켜줘야 클래스가 끝날때까지 사용이 가능합니다.
  
  override func viewDidLoad() {
    super.viewDidLoad()
     // 맵뷰의 맵타입에 인공위성으로 변경해서 표현 가능 mapView.mapType
    
    mapView.showsUserLocation = true    // 기본은 false입니다. 만약 true로 하지 않으면 현재 위치를 알려주는 동그라미가 나오지 않습니다. 지도를 사용할때 내 위치를 누르면 없던 위치가 생기는데 그때는 이걸 true, false를 변경해 주는 겁니다.
    locationManager.delegate = self // CLLocationManagerDelegate
    checkAuthorizationStatus()      // 이걸 가장 먼저 체크 해줘야 합니다.
  }
  
  
  private func checkAuthorizationStatus() {
    switch CLLocationManager.authorizationStatus() {    // 값을 받아와서 케이스 별로나눕니다. 필요한 경우에 맞춰서 사용하면 됩니다.
    case .notDetermined:
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
      startUpdatingLocation()                           // 여기서는 둘다 상관이 없어서 여기에서 모니터링을 시작하도록 해줬습니다.
    }
  }
  
  private func startUpdatingLocation() {                // 모니터링 시작 처리
    let status = CLLocationManager.authorizationStatus()    // status를 다시 한번 받아와서
    guard status == .authorizedAlways || status == .authorizedWhenInUse,    // 현재 상태를 처리
      CLLocationManager.locationServicesEnabled()           // 권한 체크
      else { return }
    locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters   // 로케이션 객체에.디자이너스어큐러시를 설정 - 여기서는 텐미터로 설정
    locationManager.distanceFilter = 10.0                                   // 10미터 보다 많이 이동했다고 판단이 되었을때 업데이트를 합니다.
    // 위에까지의 설정이 충족되는 순간부터 알림을 델리게이트로 보냅니다.
    locationManager.startUpdatingLocation()                                 // 실제로 모니터링을 시작합니다. - 결과는 델리게이트로 didUpdateLocations
                                                                            // 필요없으면 스탑로케이팅
  }
  
    
    
    
    /*
     ---------- [ didUpdateHeading ] ----------
     trueHeading : 339.682678222656
     magneticHeading : 348.144226074219
     values 6.59819984436035, 22.0639629364014, -10.676513671875
     */
   // 방향을 모니터링 할수 있습니다. 핸드폰에 연결해서 방향 모니터링 버튼을 클릭하고 보면 좌표가 출력됩니다.
  @IBAction private func mornitoringHeading(_ sender: Any) {
    guard CLLocationManager.headingAvailable() else { return }      // 방향을 체크하고
    locationManager.startUpdatingHeading()                          // 업데이트를 해주면 델리게이트에서 받습니다. didUpdateHeading
  }
  
    // 방향 모니터링 중단입니다.
  @IBAction private func stopMornitoring(_ sender: Any) {
    locationManager.stopUpdatingHeading()
  }
}


// MARK: - CLLocationManagerDelegate

extension MyLocationViewController: CLLocationManagerDelegate {
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    let current = locations.last!       // 가장마지막 정보를 가져와서
    
    if (abs(current.timestamp.timeIntervalSinceNow) < 10) { // 혹시나 캐쉬된 오래된 정보가 남아 있을것 같으면 10초 이내에 받은거만 처리
      let coordinate = current.coordinate                   // current에는 CLocation에 대한 정보가 들어가 있는데, 여기서는 coordinate(좌표)를 따로 뺐습니다.
      let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)    // 맵이 보여지는 범위 같은걸 설정하는 정보입니다. MKCoordinateSpan에 있는 스팬이 0.01이면 0.01도 단위입니다. 위도 1도는 약 111km가 되고, 높을수록 지도가 넓은 범위를 보여주고, 작을수록 작은 범위를 보여줍니다. 경도 1도는 위도에 따라서 변화하게 되고 적도로 가면 약 111미터 이고 극지방으로 가면 0에 가까워집니다.

        // 좌표를 잡고 반경을 정했으니까 실제로 적용
      let region = MKCoordinateRegion(center: coordinate, span: span) // coordinate센터 실제 반경 span
      mapView.setRegion(region, animated: true) // 그 구역을 맵뷰에 반영하는 코드입니다.
      
      let annotation = Annotation(title: "MyLocation", coordinate: coordinate)  // 핀을 별도로 찍을때 사용합니다. // 클래스를 만들거입니다. 아래 있다.
      if let anno = mapView.annotations.first { // 오노테이션을 여러개 찍을수가 있는데 위치가 이동되면 이게 여러번 호출 되니까 기존껄 제거하고 새로 찍어줌
        // 제대로 제거 하려면 나머지 어노테이션도 다 제거하면 됩니다.
        mapView.removeAnnotation(anno)
      }
      mapView.addAnnotation(annotation)
    }
  }
  
    // 변경사항이 발생하면 이게 호출이 됭서 상태에 대한 업데이트를 할수 있습니다. 유저가 설정에서 변경할 경우 이런걸 이용할수 있습니다.
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
  
    // 에러를 관리하는 델리게이트입니다.
  func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    if let error = error as? CLError, error.code == .denied {
      // Location updates are not authorized.
      // Stop Requesting Location Service
      return
    }
    // Notify the user of any errors.
  }
  
    // 방향을 다룰수 있습니다.
  func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
    print("\n---------- [ didUpdateHeading ] ----------")
    print("trueHeading :", newHeading.trueHeading)
    print("magneticHeading :", newHeading.magneticHeading)      // 헤딩에도 종류가 있습니다. Range:  0.0 - 359.9 degrees, 0 being magnetic North
    print("values \(newHeading.x), \(newHeading.y), \(newHeading.z)")
  }
}



class Annotation: NSObject, MKAnnotation { // MKAnnotation 프로토콜 타입을 채택해서 어노테이션을 구현.
  var title: String?
  var coordinate: CLLocationCoordinate2D
  
  init(title: String, coordinate: CLLocationCoordinate2D) {
    self.title = title
    self.coordinate = coordinate
  }
}
