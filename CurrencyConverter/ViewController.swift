//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Sean Acres on 6/3/19.
//  Copyright © 2019 Sean Acres. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    enum CurrencyType {
        case cad
        case peso
    }
    
    var currencyType: CurrencyType = .cad
    var currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }()
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyLabel: UILabel!
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var mxnButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func convertButtonPressed(_ sender: Any) {
        guard let convertAmountString = fromCurrencyTextField.text,
            let convertAmount = Double(convertAmountString) else { return }
    
        let convertedAmount = convert(dollars: convertAmount, to: currencyType)
        toCurrencyTextField.text = currencyFormatter.string(from: NSNumber(value: convertedAmount))
    }
  
    @IBAction func cadButtonPressed(_ sender: Any) {
        currencyType = .cad
        toCurrencyLabel.text = "Currency (CAD)"
        cadButton.isSelected.toggle()
        mxnButton.isSelected.toggle()
    }
    
    @IBAction func mxnButtonPressed(_ sender: Any) {
        currencyType = .peso
        toCurrencyLabel.text = "Currency (MXN)"
        cadButton.isSelected.toggle()
        mxnButton.isSelected.toggle()
    }
    
    func convert(dollars: Double, to unit: CurrencyType) -> Double {
        if unit == .cad {
            return dollars * 1.35
        } else {
            return dollars * 19.78
        }
    }
    
}

