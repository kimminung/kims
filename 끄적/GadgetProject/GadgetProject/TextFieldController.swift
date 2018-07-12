//
//  TextFieldController.swift
//  GadgetProject
//
//  Created by 김민웅 on 2018. 7. 11..
//  Copyright © 2018년 김민웅. All rights reserved.
//
import Foundation
import UIKit

final class TextFieldController: UIViewController {

    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var textView: UITextView!
    @IBOutlet private weak var tableView: UITableView!
    //    @IBOutlet private weak var tableView: UITableViewCell!
    var isQuadruple = false


    //    @IBOutlet private weak var swipeGestureRecognizer: UISwipeGestureRecognizer!

    override func viewDidLoad() {
        super.viewDidLoad()

        textField.layer.cornerRadius = textField.frame.width / 2
        textField.layer.masksToBounds = true


        //        swipeGestureRecognizer.direction = [.left, .right]
    }

    @IBAction private func textRotationGesture(_ sender: UIRotationGestureRecognizer) {
        let rotation = sender.rotation
        textField.transform = textField.transform.rotated(by: rotation)
        textView.transform = textView.transform.rotated(by: rotation)
        tableView.transform = tableView.transform.rotated(by: rotation)

        sender.rotation = 0
    }
    /*
     @IBAction private func textViewRotationGesture(_ sender: UIRotationGestureRecognizer) {
     let rotation = sender.rotation
     textView.transform = textView.transform.rotated(by: rotation)
     sender.rotation = 0
     }

     @IBAction private func tableViewRotationGesture(_ sender: UIRotationGestureRecognizer) {
     let rotation = sender.rotation
     tableView.transform = tableView.transform.rotated(by: rotation)
     sender.rotation = 0
     }
     */
}
