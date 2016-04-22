//
//  PickerView.swift
//  ObserberGraph
//
//  Created by 有村琢磨 on 2016/04/22.
//  Copyright © 2016年 有村琢磨. All rights reserved.
//

import UIKit

class PickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var pickerView: UIPickerView!
    let graphView = GraphView()
    var noOfPoints: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        noOfPoints = graphView.graphPoints.count
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
    }
    
    
    
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

}
