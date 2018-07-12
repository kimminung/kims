//
//  ScrollViewPaging.swift
//  GadgetProject
//
//  Created by 김민웅 on 2018. 7. 11..
//  Copyright © 2018년 김민웅. All rights reserved.
//

import Foundation
import UIKit

final class ScrollViewPagingController: UIViewController {
    
    // MARK: Properties
    
    private let pageControl = UIPageControl()
    private let scrollView = UIScrollView()
    
    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: Setup
    
    private func setupUI() {
        scrollView.frame = view.frame
        print(view.frame)
        scrollView.isPagingEnabled = true   //절반 이상 이동시 넘어가는것
        scrollView.delegate = self
        view.addSubview(scrollView)
        
        let pageColors: [UIColor] = [.red, .blue, .gray, .magenta]
        pageColors.forEach(addPageToScrollView(with:))
        
        //
        pageControl.frame = CGRect(
            x: view.frame.midX - 20, y: view.frame.height - 60, width: 40, height: 20
        )
        view.addSubview(pageControl)    //뷰에 고정시켜야 스크롤뷰를 안따라다님
    }
    
    private func addPageToScrollView(with color: UIColor) {
        let pageFrame = CGRect(
            origin: CGPoint(x: scrollView.contentSize.width, y: 0),   //contentSize는 0,0
            size: scrollView.frame.size
        )
        let colorView = UIView(frame: pageFrame)
        colorView.backgroundColor = color.withAlphaComponent(0.6)
        scrollView.addSubview(colorView)
        
        scrollView.contentSize.width += view.frame.width    //뷰의 프레임이
        pageControl.numberOfPages += 1                      //페이지가 늘어남에 따라 늘어남
    }
}

// MARK: - UIScrollViewDelegate

extension ScrollViewPagingController: UIScrollViewDelegate {
    //가속도가 붙었다가 감속이 일어날 때 호출됨
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x / scrollView.frame.width)
        pageControl.currentPage = page
    }
    //DidScroll~~~을 쓰면 움직이는동안 계속 출력
}
