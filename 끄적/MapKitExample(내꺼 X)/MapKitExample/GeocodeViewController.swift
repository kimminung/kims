//
//  GeocodeViewController.swift
//  MapKitExample
//
//  Created by giftbot on 2018. 7. 12..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit
import MapKit

/***************************************************
 맵뷰 터치 시 해당 좌표에 맞는 위경도 값을 통해 주소값 확인하기
 ***************************************************/


// 스토리보드 - 맵뷰에 탭 제츠쳐 레코나이져를 올려 놨습니다.
// 테이블뷰 2번째 메뉴, 터치할때마다 터치하는곳의 실제 주소가 나옵니다.

final class GeocodeViewController: UIViewController {

  @IBOutlet private weak var mapView: MKMapView!
  
  @IBAction func recognizeTap(gesture: UITapGestureRecognizer) {        // UIapGestureRecognizer를 액션 연결을 했습니다.
    let touchPoint = gesture.location(in: gesture.view)                 // 제스쳐 로케이션의 터치 포인터를 받아와서
    let coordinate = mapView.convert(touchPoint, toCoordinateFrom: mapView) // 터치 포인터를 맵뷰로 전환 -> CLLocationCoordinate2D(위, 경도)
    let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude) //latitude, longitude를 넣어서 CLLocation객체를 만들고
    let geocoder = CLGeocoder() // 지오코더라는걸 사용합니다.
    
    // reverseGeocodeLocation에 요청하는것은
    // reverseGeocodeLocation 좌표를 지명으로 변경
//    geocoder.reverseGeocodeLocation(<#T##location: CLLocation##CLLocation#>, completionHandler: <#T##CLGeocodeCompletionHandler##CLGeocodeCompletionHandler##([CLPlacemark]?, Error?) -> Void#>)
    // 비동기로 요청 후 그 결과 (completionHandler) 는 MainThread 에서 처리됨   // 처리를 안해줘도 메인핸들러에서 처리됩니다.
    // Geocoding 요청 중에는 또 다른 Geocoding 작업을 요청하지 말 것
    geocoder.reverseGeocodeLocation(location) { placeMark, error in // 인자로 CLLocation을 넣어주고 찍은 값이 placeMark로 값이 넘어오게 됩니다. 문제가 있으면 error
      if error != nil {
        print(error!.localizedDescription)
        return
      }
        // 넘어오는 좌표를 지명으로 변경하는 과정입니다.
      guard let address = placeMark?.first, // 객체의 첫번째를 꺼내와서
        // 값들이 전부 옵셔널이기 때문에 나올수도 안나올수도
        // 나라마다 주소체계가 다르기 때문에 안나올수도 있습니다.
        // 내부에 여러가지 속성이 있으니까 확인해보면 좋습니다.
        let country = address.country,
        let administrativeArea = address.administrativeArea,
        let name = address.name
        else { return }
      print("\n---------- [ 터치 좌표 주소 ] ----------")
      print("- \(country) \(administrativeArea) \(name)")
        
        // 다시 좌표로 변경합니다.
        let addr = "\(country) \(administrativeArea) \(name)"
        geocoder.geocodeAddressString(addr, completionHandler: { (placeMark, error) in
            print(placeMark)
        })
    }
    
  }
}

