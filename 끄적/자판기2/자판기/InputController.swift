//
//  InputController.swift
//  자판기
//
//  Created by 김민웅 on 08/06/2018.
//  Copyright © 2018 김민웅. All rights reserved.
//

import Foundation
import UIKit

protocol InputDelegate: class {
    func input()
}


class Input: UIButton {
    
    weak var delegate: InputDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        setTitle("1000"+"원", for: .normal)
        setTitleColor(.black, for: .normal)
        backgroundColor = .orange
        addTarget(self, action: #selector(doSomething), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet private weak var displayLabel: UILabel!
    var resultNum = 0
    var displayText = ""
    var bufferOperator: Operator?
    
    
    
    
    private func changeState(command: Command) {
        switch command {
        case .clear:
            clearAndSet(as: 0)
        case .equal:
            guard let op = bufferOperator else { return }
            clearAndSet(as: op.calculate(resultNum, Int(displayText) ?? 0))
        case .operation(let op):
            guard !displayText.isEmpty else { return bufferOperator = op }
            calculate(for: op)
        case .addNumber(let c):
            displayText = displayText.isEmpty ? String(c) : displayText + String(c)
            displayLabel.text = addComma(to: displayText)
        }
    }
    
    
    private func clearAndSet(as num: Int, and buffer: Operator? = nil) {
        resultNum = num
        displayLabel.text = addComma(to: "\(num)")
        bufferOperator = buffer
        displayText = ""
    }
    
    private func calculate(for op: Operator?) {
        guard let newValue = Int(displayText) else { return }
        
        let result = (bufferOperator != nil)
            ? bufferOperator!.calculate(resultNum, newValue)
            : newValue
        clearAndSet(as: result, and: op)
    }
    
    private func addComma(to numString: String) -> String {
        guard let number = Int(numString) else { return "0" }
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(integerLiteral: number)) ?? "0"
    }
    
    @IBAction private func buttonDidTap(_ button: UIButton) {
        guard let command = button.titleLabel?.text else { return }
        
        switch command {
        case "AC":
            changeState(command: .clear)
        case "=":
            changeState(command: .equal)
        case "+", "-":
            changeState(command: .operation(Operator(rawValue: command)!))
        default:
            changeState(command: .addNumber(command.first!))
        }
    }
    
    @objc func doSomething() {
        
        
        delegate?.input()
        
    }
    
}
