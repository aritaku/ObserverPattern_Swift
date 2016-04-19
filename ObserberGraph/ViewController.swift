//
//  ViewController.swift
//  ObserberGraph
//
//  Created by 有村琢磨 on 2016/04/12.
//  Copyright © 2016年 有村琢磨. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var graphLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var graphView: GraphView!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var noOfPoints: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        setGraphpointCount()
        
        slider.maximumValue = 100
        slider.minimumValue = 0
        
        let firstNumber: Int = graphView.graphPoints[noOfPoints - 1]
        graphLabel.text = String(firstNumber)
        textField.text = String(firstNumber)
        slider.value = Float(firstNumber)
        pickerView.selectRow(firstNumber - 1, inComponent: 0, animated: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func changed_slider() {
        graphView.graphPoints[noOfPoints - 1] = Int(self.slider.value)
        textField.text = String(Int(self.slider.value))
        graphLabel.text = String(Int(self.slider.value))
        print(Int(self.slider.value))
        pickerView.selectRow(Int(self.slider.value - 1), inComponent: 0, animated: true)
        graphView.setNeedsDisplay()

    }
    
    @IBAction func changed_textField(){
        if self.textField.text != "" {
           graphView.graphPoints[noOfPoints - 1] = Int(self.textField.text!)!
           slider.value = Float(self.textField.text!)!
           graphLabel.text = String(UTF8String: self.textField.text!)!
           pickerView.selectRow(Int(textField.text!)! - 1, inComponent: 0, animated: true)

        }
        print(slider.value)
        print(graphLabel.text)
                graphView.setNeedsDisplay()

    }
    
    func setGraphpointCount(){
        noOfPoints = graphView.graphPoints.count
    }
    
    // MARK: - PickerView
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 100
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(row + 1)
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(row + 1)
        let selectedNumber: Int = row + 1
        graphView.graphPoints[noOfPoints - 1] = selectedNumber
        textField.text = String(selectedNumber)
        slider.value = Float(selectedNumber)
        graphLabel.text = String(selectedNumber)
        graphView.setNeedsDisplay()
    }
    

}

/*
protocol PropertyObserver : class {
    //オブジェクトの登録
    func willChangePropertyName(propertyName:String, newPropertyValue:AnyObject?)
    //オブジェクトにメッセージ送信
    func didChangePropertyName(propertyName:String, oldPropertyValue:AnyObject?)
}

class TestChambers {
    
    weak var observer:PropertyObserver?
    
    var testChamberNumber: Int = 0 {
        willSet(newValue) {
            observer?.willChangePropertyName("testChamberNumber", newPropertyValue:newValue)
        }
        didSet {
            observer?.didChangePropertyName("testChamberNumber", oldPropertyValue:oldValue)
        }
    }
}

class Observer : PropertyObserver {
    func willChangePropertyName(propertyName: String, newPropertyValue: AnyObject?) {
        if newPropertyValue as? Int == 1 {
            print("Okay. Look. We both said a lot of things that you're going to regret.")
        }
    }
    
    func didChangePropertyName(propertyName: String, oldPropertyValue: AnyObject?) {
        if oldPropertyValue as? Int == 0 {
            print("Sorry about the mess. I've really let the place go since you killed me.")
        }
    }
}
*/


