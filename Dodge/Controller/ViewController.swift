//
//  ViewController.swift
//  Dodge
//
//  Created by wangchu sherpa on 26/08/2021.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, CoinManagerDelegate{
    func didUpdatePrice(price: String, currency: String) {
        DispatchQueue.main.async {
            self.dodgeLabel.text = price
            self.currencyLabel.text = currency
        }
    }
    
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    
    var coinManager = CoinManager()
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
    

    @IBOutlet weak var dodgeLabel: UILabel!
    
    @IBOutlet weak var currencyLabel: UILabel!
    
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        
        coinManager.delegate = self
        
        
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedCurrency = coinManager.currencyArray[row]
        coinManager.getCoinPrice(for: selectedCurrency)
        
    }
}

