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

final class GeocodeViewController: UIViewController {
    
    @IBOutlet private weak var mapView: MKMapView!
    
    @IBAction func recognizeTap(gesture: UITapGestureRecognizer) {
        let touchPoint = gesture.location(in: gesture.view)
        //터치포인트를 맵뷰로 전환시켜서 좌표를 받음
        let coordinate = mapView.convert(touchPoint, toCoordinateFrom: mapView)
        let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
        let geocoder = CLGeocoder()
        
        
        // 비동기로 요청 후 그 결과 (completionHandler) 는 MainThread 에서 처리됨
        // Geocoding 요청 중에는 또 다른 Geocoding 작업을 요청하지 말 것
        //지명을 좌표로 바꿈
        //    geocoder.geo...
        //좌표를 지명으로 바꿈
        geocoder.reverseGeocodeLocation(location) { placeMark, error in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            //어드레스 값으로 지명을 변경해서 사용
            guard let address = placeMark?.first,//옵셔널first
                let country = address.country,//옵셔널country
                let administrativeArea = address.administrativeArea,//옵셔널
                let locality = address.locality,
                let name = address.name//옵셔널
                //address.thoroughfare...
                else { return }
            print("\n---------- [ 터치 좌표 주소 ] ----------")
            print("- \(country) \(administrativeArea) \(name) \(locality)")
            
            //지오코드를 이용해서 지명을 가지고 좌표값을
            let addr = "\(country) \(administrativeArea) \(name) \(locality)"
            
            geocoder.geocodeAddressString(addr, completionHandler: { (placeMark, error) in
                print(placeMark)
            })
            /*
             ---------- [ 터치 좌표 주소 ] ----------
             - South Korea Gyeonggi-do 495-6 Sangdaewon-dong Seongnam-si
             Optional([495-6 Sangdaewon-dong, 495-6 Sangdaewon-dong, Jungwon-gu, Seongnam-si, Gyeonggi-do, South Korea @ <+37.43045390,+127.17542830> +/- 100.00m, region CLCircularRegion (identifier:'<+37.43045390,+127.17542830> radius 70.65', center:<+37.43045390,+127.17542830>, radius:70.65m)])
             */
            //실제 좌표를 직접 얻는법. - 구글맵->클릭->우클릭->이 위치가 궁금한가요?->아래에 좌표와 같이 표시
        }
    }
}

