//
//  ViewController.swift
//  ObserberGraph
//
//  Created by 有村琢磨 on 2016/04/12.
//  Copyright © 2016年 有村琢磨. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var graphLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var graphView: GraphView!
    
    var noOfPoints: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGraphpointCount()
        
        slider.maximumValue = 100
        slider.minimumValue = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func changed_slider() {
        graphView.graphPoints[noOfPoints - 1] = Int(self.slider.value)
        textField.text = String(Int(self.slider.value))
        graphLabel.text = String(Int(self.slider.value))
        print(Int(self.slider.value))
        graphView.setNeedsDisplay()
    }
    
    @IBAction func changed_textField(){
        if self.textField.text != "" {
           graphView.graphPoints[noOfPoints - 1] = Int(self.textField.text!)!
           slider.value = Float(self.textField.text!)!
           graphLabel.text = String(UTF8String: self.textField.text!)!
        }
        print(slider.value)
        print(graphLabel.text)
        graphView.setNeedsDisplay()
    }
    
    func setGraphpointCount(){
        noOfPoints = graphView.graphPoints.count
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


