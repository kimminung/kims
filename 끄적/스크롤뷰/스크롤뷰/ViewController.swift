//
//  ViewController.swift
//  스크롤뷰
//
//  Created by 김민웅 on 19/06/2018.
//  Copyright © 2018 김민웅. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var imageView: UIImageView!
    
    private var zoomScale: CGFloat = 1 {
        didSet{
            print("zoomScale: ", String(format: "%.2f", zoomScale)) //%.2f 소숫점 2자리까지만 출력
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        scrollView.delegate = self  //
        updateScrollViewZoomScale()
    }
    
    private func updateScrollViewZoomScale() {
        let widthScale = view.bounds.width / imageView.bounds.width
        let heightScale = view.bounds.height / imageView.bounds.height
        let minScale = min(widthScale, heightScale)
        
        scrollView.minimumZoomScale = minScale  //축소
        scrollView.zoomScale = 1    //원본크기
        scrollView.maximumZoomScale = 3 //원본의 3배 확대
    }
    
    @IBAction private func fitToWidth(_sender: Any){
        print("---------fitToWidth---------")
        let ratio = scrollView.frame.width / imageView.image!.size.width
        scrollView.setZoomScale(ratio, animated: true)  //비율값
        zoomScale = scrollView.zoomScale
    }
    
    @IBAction private func scaleDouble(_sender: Any){
        
        print("---------fitToWidth---------")
        scrollView.setZoomScale(zoomScale * 2, animated: true)
        zoomScale = scrollView.zoomScale    //현재 상태에 반영을 해줘야 계속 커짐
        
        //        zoomScale *= 2                    //이런식으로 쓰면 안된다
        //        scrollView.setZoomScale(zoomScale, animated: true)
        
    }
    
    @IBAction private func moveContent(_sender: Any){
        print("---------fitToWidth---------")
        let newOffset = CGPoint(x:scrollView.contentOffset.x + 150,
                                y:scrollView.contentOffset.y + 150)
        scrollView.setContentOffset(newOffset, animated: true)
    }
}

//MARK: - UIScrollViewController    //<------마크 해두면 위의 경로 스크롤뷰>스크롤뷰..부분에 눌러서 경로이동확이 가능
//MARK: - UIScrollViewController -  // - 바를 통해 구분기호
//TODO: - UIScrollViewController    //
//FIXME: - UIScrollViewController   //고칠것 아이콘

extension ViewController: UIScrollViewDelegate {
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        //zoom이 끝났을 때
    }
    
    func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?) {
        //zooming이 시작될때
    }
    
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        //zooming 끝났을 때
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        //줌을 할지 말지 결정하는 놈
        //        return UIView()
        return imageView
    }
    
}

