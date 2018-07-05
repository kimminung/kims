//
//  ViewController.swift
//  DocumentInteractionViewController
//
//  Created by giftbot on 2018. 3. 2..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit

final class DocumentInteractionViewController: UIViewController {
  
  
  let documentInteractionController = UIDocumentInteractionController()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupInteractionController()
  }
  
  private func setupInteractionController() {
    documentInteractionController.url = Bundle.main.url(forResource: "iPhone", withExtension: "png")
    documentInteractionController.delegate = self
  }
  
  @IBAction private func filePreview(_ sender: Any) {
    documentInteractionController.presentPreview(animated: true)
  }
  
  
  @IBAction private func sendFile(_ sender: Any) {
    documentInteractionController.presentOptionsMenu(from: view.bounds, in: view, animated: true)
  }
}

// MARK: - UIDocumentInteractionControllerDelegate

//파일을 넘길때 사용
extension DocumentInteractionViewController: UIDocumentInteractionControllerDelegate {
  func documentInteractionControllerViewControllerForPreview(
    _ controller: UIDocumentInteractionController
    ) -> UIViewController {
    return self
  }
}
