//
//  ViewController.swift
//  ObserberGraph
//
//  Created by 有村琢磨 on 2016/04/12.
//  Copyright © 2016年 有村琢磨. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, Observer {
    
    @IBOutlet var graphLabel: UILabel!
    @IBOutlet var textField: UITextField!
    @IBOutlet var slider: UISlider!
    @IBOutlet var graphView: GraphView!
    @IBOutlet var pickerView: UIPickerView!
//    var graphModel = Model()
    
    var noOfPoints: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        slider.maximumValue = 100
        slider.minimumValue = 0
        
        setGraphpointCount()
        update(graphView.graphPoints[noOfPoints - 1])
        
        graphView.add(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func changed_slider() {
        graphView.graphPoints[noOfPoints - 1] = Int(self.slider.value)
        graphView.observerNotify(graphView.graphPoints[noOfPoints - 1])
    }
    
    @IBAction func changed_textField(){
        if self.textField.text != "" {
            graphView.graphPoints[noOfPoints - 1] = Int(self.textField.text!)!
            graphView.observerNotify(graphView.graphPoints[noOfPoints - 1])
        }
    }
    
    func setGraphpointCount(){
        noOfPoints = graphView.graphPoints.count
        print("noOfPoints = \(noOfPoints)")
    }
    
    //PickerView
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
        graphView.graphPoints[noOfPoints - 1] = self.pickerView.selectedRowInComponent(0)
        graphView.observerNotify(graphView.graphPoints[noOfPoints - 1])
    }
    
    //Observer Protocol
    func update(newValue: Int) {
        print("observer update")
        textField.text = String(newValue)
        slider.value = Float(newValue)
        graphLabel.text = String(newValue)
        pickerView.selectRow(newValue - 1, inComponent: 0, animated: true)
        graphView.setNeedsDisplay()
    }
}
