//
//  ViewController.swift
//  kadai12
//
//  Created by 永野玄 on 2021/05/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var taxExcluded: UITextField!
    @IBOutlet private weak var consumotionTax: UITextField!
    @IBOutlet private weak var resultLabel: UILabel!

    private var userDefaults = UserDefaults.standard

    private static let taxRateKey = "taxRateKey"

    override func viewDidLoad() {
        super.viewDidLoad()

        let rate = userDefaults.float(forKey: Self.taxRateKey)
        if rate != 0 {
            consumotionTax.text = String(rate)
        }
    }
    
    @IBAction func calcButton(_ sender: Any) {
        let taxExcluded = Int(self.taxExcluded.text!) ?? 0
        let taxRate = Float(self.consumotionTax.text!) ?? 0

        if let rate = Float(consumotionTax.text ?? "") {
            UserDefaults.standard.set(rate, forKey: Self.taxRateKey)
        }

        let calcResult = taxExcluded + Int(Float(taxExcluded) * taxRate / 100.0)

        resultLabel.text = String(calcResult)
    }
}
