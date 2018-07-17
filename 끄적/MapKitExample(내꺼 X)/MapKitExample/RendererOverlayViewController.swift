//
//  RendererOverlayViewController.swift
//  MapKitExample
//
//  Created by giftbot on 2018. 7. 13..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit
import MapKit


// 맵뷰에 원이나, 별을 표시해서 해당 위치안에 뭐가 있다라고 표시 할수 있습니다.
// 오버레이를 이용합니다.
final class RendererOverlayViewController: UIViewController {
  
  @IBOutlet private weak var mapView: MKMapView!    // 맵뷰하나 올려져 있고
  
  @IBAction func addCircle(_ sender: Any) {
    let center = mapView.centerCoordinate       // 특정위치에 넣을수도 있는데 맵의 정중앙을 잡아주고
    let circle = MKCircle(center: center, radius: 40000)    // 반지름을 40_000으로 설정했습니다. MKCircly는 MKShape, MKOverlay를 받고 있습니다. 이것도 어노테이션의 일종입니다.
    mapView.add(circle)         // 오버레이 추가
  }
  
    // 별을 그리는 메소드입니다.
    // 별은 원과 다르게 없기때문에 만들어서 그려줘야 합니다.
  @IBAction func addStar(_ sender: Any) {
    let center = mapView.centerCoordinate   // 맵뷰의 중앙
    
    var point1 = center; point1.latitude += 0.65
    var point2 = center; point2.longitude += 0.4;   point2.latitude -= 0.15
    var point3 = center; point3.longitude -= 0.45; point3.latitude += 0.4
    var point4 = center; point4.longitude += 0.45; point4.latitude += 0.4
    var point5 = center; point5.longitude -= 0.4;   point5.latitude -= 0.15
    
    let points: [CLLocationCoordinate2D] = [point1, point2, point3, point4, point5, point1] // 배열에 모아서
    let polyline = MKPolyline(coordinates: points, count: points.count) // 다각형을 그릴때 사용합니다. 포인트 배열과 그 포인트의 카운터를 넣어주면
    
    mapView.add(polyline)   // 위 메소드와 마찬가지로 에드 했다고 끝이 아니고 델리게이트에서 마무리 해야 합니다.
  }
  
    // 오버레이를 제거합니다.
  @IBAction private func removeOverlays(_ sender: Any) {
    mapView.removeOverlays(mapView.overlays)
  }
    
    // 연습 - 패스트캠퍼스 성수의 좌표를 사용해서 핀 추가를 누르면 패스트 캠퍼스 성수를 찾아가고 원을 표시하였습니다.
    @IBAction private func addFasetPin(_ sender: Any) {
        // 지정한 좌표에 핀을 찍고
        let fastcampus = MKPointAnnotation()
        fastcampus.coordinate = CLLocationCoordinate2D(latitude:  37.545046, longitude: 127.057174)
        fastcampus.title = "FastCampus"
        mapView.addAnnotation(fastcampus)
        
        let span = MKCoordinateSpanMake(0.01, 0.01)
        let region = MKCoordinateRegionMake(fastcampus.coordinate, span)
        mapView.setRegion(region, animated: true)
        
        let circle = MKCircle(center: fastcampus.coordinate, radius: 100)
        mapView.add(circle)     // 델리게이트가 있어서 가능한거입니다.
    }
}


// MARK: - MKMapViewDelegate

extension RendererOverlayViewController: MKMapViewDelegate {
    // 델리게이트 부분을 제거 하고 하면 서클은 생성이 안됩니다.
  func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
    if let circle = overlay as? MKCircle {  // if 바인딩으로 MKSircle로 만들어진거인지 체크합니다.
      let renderer = MKCircleRenderer(circle: circle)   // MKCircleRenderer를 만드는데 그 서클을 위에서 만들어준 서클을 넣어줍니다. (좌표와 반지름을 가지고 있습니다)
    //        renderer.strokePath(<#T##path: CGPath##CGPath#>, in: <#T##CGContext#>) 여기서 속성도 지정가능합니다.
      renderer.strokeColor = UIColor.blue
      renderer.lineWidth = 2        // 선의 두께
      return renderer               //  -> MKOverlayRenderer로 리턴되면서 그려집니다.
    }
    if let polyline = overlay as? MKPolyline {
      let renderer = MKPolylineRenderer(polyline: polyline)
      renderer.lineWidth = 2
      renderer.strokeColor = .red
      return renderer
    }
    return MKOverlayRenderer(overlay: overlay)
  }
}
