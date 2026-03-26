//
//  ViewController.swift
//  Counter
//
//  Created by арина сильченко on 23.03.26.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet private weak var historyTextView: UITextView!
    
    @IBOutlet private weak var counterLabel: UILabel!
    
    @IBOutlet private weak var minusButton: UIButton!
    
    @IBOutlet private weak var plusButton: UIButton!
    
    @IBOutlet private weak var toZeroButton: UIButton!
    
    private var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counterLabel.text = "0"
    }
    
    private func printValue(_ count: Int)
    {
        counterLabel.text = "Значение счётчика: \(count)"
    }

    private func addToHistory(_ text: String) {
        historyTextView.text = historyTextView.text + "\n\(Date.now.formatted(date: .numeric, time: .shortened)): " + text
        let range = NSRange(location: historyTextView.text.count - 1, length: 1)
        historyTextView.scrollRangeToVisible(range)
    }
    
    @IBAction private func increaseCounter(_ sender: UIButton) {
        count += 1
        printValue(count)
        addToHistory("значение изменено на +1")
    }
    
    
    @IBAction private func reduceCounter(_ sender: UIButton) {
        guard count != 0 else {
            addToHistory("попытка уменьшить значение счётчика ниже 0")
            return }
        count -= 1
        printValue(count)
        addToHistory("значение изменено на -1")
    }
    
    
    @IBAction private func toZero(_ sender: UIButton) {
        count = 0
        printValue(count)
        addToHistory("значение сброшено")
    }

    
}

