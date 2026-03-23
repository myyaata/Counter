//
//  ViewController.swift
//  Counter
//
//  Created by арина сильченко on 23.03.26.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        CounterLabel.text = "0"
    }
    
    private var count = 0
    
    private func printValue(_ count: Int)
    {
        CounterLabel.text = "Значение счётчика: \(count)"
    }

    private func addToHistory(_ text: String) {
        HistoryTextView.text = HistoryTextView.text + "\n\(Date.now.formatted(date: .numeric, time: .shortened)): " + text
        let range = NSRange(location: HistoryTextView.text.count - 1, length: 1)
        HistoryTextView.scrollRangeToVisible(range)
    }
    
    @IBAction func IncreaseCounter(_ sender: UIButton) {
        count += 1
        printValue(count)
        addToHistory("значение изменено на +1")
    }
    
    
    @IBAction func ReduceCounter(_ sender: UIButton) {
        guard count != 0 else {
            addToHistory("попытка уменьшить значение счётчика ниже 0")
            return }
        count -= 1
        printValue(count)
        addToHistory("значение изменено на -1")
    }
    
    
    @IBAction func ToZero(_ sender: UIButton) {
        count = 0
        printValue(count)
        addToHistory("значение сброшено")
    }
    
    @IBOutlet weak var HistoryTextView: UITextView!
    
    @IBOutlet weak var CounterLabel: UILabel!
    
    @IBOutlet weak var MinusButton: UIButton!
    
    @IBOutlet weak var PlusButton: UIButton!
    
    @IBOutlet weak var ToZeroButton: UIButton!
    
}

