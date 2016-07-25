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
	@IBOutlet weak var pickerView: UIPickerView!
	
    var fruitsArray = ["🍎", "🍊"]//, "🍌", "🍐", "🍇", "🍉", "🍓", "🍒", "🍍"]
	var numberOfRows = 1000
	var numberOfComponents = 3
	
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
		self.pickerView.accessibilityLabel = Constants.FRUIT_PICKER
        self.spinButton.accessibilityLabel = Constants.SPIN_BUTTON
		self.pickerView.delegate = self
		self.pickerView.dataSource = self
        
    }
	
    
    @IBAction func spinButtonTapped(sender: UIButton) {
		chooseFruit()
		showResult()
        
    }
	
	func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return numberOfRows
	}
	
	func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
		return numberOfComponents
	}
	
	func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		return self.fruitsArray[row % self.fruitsArray.count]
	}
	
	func chooseFruit() {
		for i in 0..<numberOfComponents {
			let randomNumber = arc4random_uniform(UInt32(numberOfRows))
			pickerView.selectRow(Int(randomNumber), inComponent: i, animated: true)
		}
	}
	
	func showResult() {
		
		let hitRow1 = pickerView.selectedRowInComponent(0)
		let hitRow2 = pickerView.selectedRowInComponent(1)
		let hitRow3 = pickerView.selectedRowInComponent(2)
		
		let row1Title = pickerView(pickerView, titleForRow: hitRow1, forComponent: 0)
		let row2Title = pickerView(pickerView, titleForRow: hitRow2, forComponent: 0)
		let row3Title = pickerView(pickerView, titleForRow: hitRow3, forComponent: 0)

		
		if row1Title == row2Title && row2Title == row3Title {
			resultLabel.text = "WINNER!"
		} else {
			resultLabel.text = "TRY AGAIN"
		}
	}
}
	

// MARK: Set Up
	extension ViewController {
		
		override func viewDidLayoutSubviews() {
			if self.spinButton.layer.cornerRadius == 0.0 {
				configureButton()
			}
		}

		func configureButton() {
			self.spinButton.layer.cornerRadius = 0.5 * self.spinButton.bounds.size.width
			self.spinButton.layer.borderColor = UIColor.whiteColor().CGColor
			self.spinButton.layer.borderWidth = 4.0
			self.spinButton.clipsToBounds = true
		}
		
}



