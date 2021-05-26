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
    override func viewDidLoad() {
        super.viewDidLoad()
        if let consumotionTaxNum = userDefaults.string(forKey: "userDefaults") {
            consumotionTax.text = consumotionTaxNum
        }
    }
    
    @IBAction func calcButton(_ sender: Any) {
        let taxNum:Int = Int(self.taxExcluded.text!) ?? 0
        let consumotionNum:Double = Double(self.consumotionTax.text!) ?? 0
        
        UserDefaults.standard.set(consumotionTax.text, forKey:"userDefaults")
        
        let num = ( 1 + consumotionNum / 100 )
        let calcResult:Int = Int( Double(taxNum) * (num) )
        
        resultLabel.text = String(calcResult)
    }
}
//userdefaultsを使う
