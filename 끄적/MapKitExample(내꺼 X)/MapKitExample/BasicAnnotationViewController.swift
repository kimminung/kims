//
//  BasicAnnotationViewController.swift
//  MapKitExample
//
//  Created by giftbot on 2018. 7. 13..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit
import MapKit

// 처음에 멀리 있다가 화면이 당겨지고
// 핀을 추가하면 3군데 핀을 찍고
// 남산을 확대해서 보면 시청과 남산이 보이고
// 랜덤 핀으로 이동하면 핀 위치를 찾아서 이동하게 되고
// 핀제거는 핀제거
// 카메라설정은 일반적으로 보는 고도가 아닌 옆에서 바라보듯이 핀을 수정할수도 있습니다.

final class BasicAnnotationViewController: UIViewController {
  
  @IBOutlet private weak var mapView: MKMapView!        // 스토리보드 맵뷰와 연결을 하고
  var index = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
    // 애니메이션을 주면 줌이 땡겨지면서 이동한 좌표로 이동합니다.
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    let center = CLLocationCoordinate2DMake(37.566308, 126.977948)      // 위경도 값을 넣어서 원하는 위치에 대해서 중심좌표를 잡았습니다.
    
    // Span 단위는 1도
    // 위도 1도는 약 111킬로미터. 경도 1도는 위도에 따라 변함. 적도 약 111킬로미터 ~ 극지방 0)
    let span = MKCoordinateSpanMake(0.1, 0.1)           // 스팬을 통해서 지도의 범위를 잡아주고
    let region = MKCoordinateRegionMake(center, span)   // 맵뷰에 나타날 원하는 지역을 설정해줍니다. (중심좌표, 범위(반경) 중심좌표부터 어느정도 범위까지 보여줄지를
    mapView.setRegion(region, animated: true)           // 애니메이션을 주면 줌이 땡겨지면서 이동한 좌표로 이동합니다.
    }
    /*
     class Annotation: NSObject, MKAnnotation {
     var coordinate: CLLocationCoordinate2D
     var title: String?
     }
     */
    // 핀추가
  @IBAction private func addAnnotation(_ sender: Any) {
    // coordinate - The coordinate point of the annotation, specified as a latitude and longitude. (위도와 경도로 지정된 주석의 좌표 점입니다.)
    let cityHall = MKPointAnnotation()  // 아까는 위에처럼 사용했지만 간단하게 사용할때는 여기처럼 하면 됩니다.
    cityHall.coordinate = CLLocationCoordinate2D(latitude: 37.566308, longitude: 126.977948)    // 반드시 설정해 줘야합니다.
    cityHall.title = "시청"   // 핀 바로 아래 나오는 타이틀
    cityHall.subtitle = "서울특별시" // 핀을 클릭하면 나오는 타이틀
    mapView.addAnnotation(cityHall) // 맵뷰에 올려줍니다.
    
    let namsan = MKPointAnnotation()
    namsan.title = "남산"
    namsan.coordinate = CLLocationCoordinate2D(latitude: 37.551416, longitude: 126.988194)
    mapView.addAnnotation(namsan)

    let gimpoAirport = MKPointAnnotation()
    gimpoAirport.coordinate = CLLocationCoordinate2D(latitude: 37.559670, longitude: 126.794320)
    gimpoAirport.title = "김포공항"
    mapView.addAnnotation(gimpoAirport)
  }
    
    // 핀 생성 - 연습
    @IBAction private func addFastAnnotation (_ sender: Any) {
        let fastCampus = MKPointAnnotation()
        fastCampus.coordinate = CLLocationCoordinate2D(latitude:  37.545046, longitude: 127.057174)
        fastCampus.title = "FASTCAMPUS"
        mapView.addAnnotation(fastCampus)
    }
    
    // 주소값 받아오기 - 연습
    @IBAction func recognizeTap(gesture: UITapGestureRecognizer) {
        let touchPoint = gesture.location(in: gesture.view)
        let coordinate = mapView.convert(touchPoint, toCoordinateFrom: mapView)
        let location = CLLocation(latitude: coordinate.latitude , longitude: coordinate.longitude)
        let geocoder = CLGeocoder()
        
        geocoder.reverseGeocodeLocation(location) { (placeMark, error) in
            if error != nil {
                print(error?.localizedDescription)
                return
            }
            
            guard let address = placeMark?.first,
                let name = address.name,
                let country = address.country,
                let location = address.location,
                let administrativeArea = address.administrativeArea
            else { return }
            
            print("address :", address)
            print("name :", name)
            print("country :", country)
            print("location :", location)
            print("administrativeArea :", administrativeArea)
            
        }
        
    }
  
  // 기존에 추가된 Annotation을 찾아서 이동합니다.
  @IBAction private func moveToRandomPin(_ sender: Any) {
    guard mapView.annotations.count > 0 else { return }     // mapView.annotations은 맵뷰에 어노테이션이 모두 들어 있습니다.
    let random = Int(arc4random_uniform(UInt32(mapView.annotations.count))) // 램덤숫자를 가져오는데 mapView.annotations.count(랜덤값의 상한값) 만큼 가져오고
    let annotation = mapView.annotations[random]        // 랜덤한 어노테이션이 선택이 될거고
    
    // 각 값들일 가져와서 center와 span을 만들고
    let center = CLLocationCoordinate2D(latitude: annotation.coordinate.latitude, longitude: annotation.coordinate.longitude)
    let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    // 영역을 지정합니다.
    let region = MKCoordinateRegion(center: center, span: span)
    mapView.setRegion(region, animated: true)
  }
  
    // 핀 삭제
  @IBAction private func removeAnnotation(_ sender: Any) {
    mapView.removeAnnotations(mapView.annotations)  // mapView.annotations 전체를 넘겨서 삭제 합니다.
  }
  
    // 카메라 시점 변경
  @IBAction private func setupCamera(_ sender: Any) {
    let camera = MKMapCamera()  // 맵의 카메라를 가져와서
    camera.centerCoordinate = CLLocationCoordinate2D(latitude: 37.551416, longitude: 126.988194)    // 센터 좌표를 정해주고
    // 고도 (미터 단위)
    camera.altitude = 200
    // 카메라 각도 (0일 때 수직으로 내려다보는 형태)
    camera.pitch = 70.0
    mapView.setCamera(camera, animated: true)   // 맵뷰에 카메라 셋.
  }
}
