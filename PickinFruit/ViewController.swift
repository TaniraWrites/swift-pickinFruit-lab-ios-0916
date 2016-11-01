//
//  ViewController.swift
//  PickinFruit
//
//  Created by Flatiron School on 7/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var spinButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    var fruitsArray = ["🍎", "🍊", "🍌", "🍐", "🍇", "🍉", "🍓", "🍒", "🍍"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.spinButton.accessibilityLabel = Constants.SPIN_BUTTON
        fruitPicker.delegate = self
        fruitPicker.dataSource = self
        fruitPicker.reloadAllComponents()

    }
    
    @IBAction func spinButtonTapped(_ sender: UIButton) {
        fruitPicker.selectRow(Int(arc4random_uniform(UInt32(fruitsArray.count - 1))), inComponent: 0, animated: true)
        fruitPicker.selectRow(Int(arc4random_uniform(UInt32(fruitsArray.count - 1))), inComponent: 1, animated: true)
        fruitPicker.selectRow(Int(arc4random_uniform(UInt32(fruitsArray.count - 1))), inComponent: 2, animated: true)

        winner()
        
    }
    
    
    func winner(){
        let fruit0 = fruitPicker.selectedRow(inComponent: 0)
        let fruit1 = fruitPicker.selectedRow(inComponent: 1)
        let fruit2 = fruitPicker.selectedRow(inComponent: 2)
        
        if (fruit0, fruit1) == (fruit1, fruit2) {
            resultLabel.text = "WINNER!"
        } else {
            resultLabel.text = "TRY AGAIN"
        }
    }
    @IBOutlet weak var fruitPicker: UIPickerView!
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return fruitsArray.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return fruitsArray[row]
    }
    
    
}

// MARK: Set Up
extension ViewController {
    
    override func viewDidLayoutSubviews() {
        if self.spinButton.layer.cornerRadius == 0.0 {
            configureButton()
        }
    }
    
    func configureButton()
    {
        self.spinButton.layer.cornerRadius = 0.5 * self.spinButton.bounds.size.width
        self.spinButton.layer.borderColor = UIColor.white.cgColor
        self.spinButton.layer.borderWidth = 4.0
        self.spinButton.clipsToBounds = true
    }
    
}



