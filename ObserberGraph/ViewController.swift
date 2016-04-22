//
//  ViewController.swift
//  ObserberGraph
//
//  Created by 有村琢磨 on 2016/04/12.
//  Copyright © 2016年 有村琢磨. All rights reserved.
//

import UIKit

class ViewController: UIViewController, Observer {
    
    @IBOutlet var graphLabel: UILabel!
    @IBOutlet var graphView: GraphView!
    @IBOutlet weak var sliderContainerView: SliderContainerView!
    @IBOutlet weak var pickerContainerView: PickerContainerView!
    
    var noOfPoints: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        noOfPoints = graphView.graphPoints.count
        
        graphLabel.text = String(graphView.graphPoints[noOfPoints - 1])
        graphView.add(sliderContainerView)
        graphView.add(pickerContainerView)
        graphView.add(self)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func update(newValue: Int) {
        graphLabel.text = String(newValue)
        graphView.graphPoints[noOfPoints - 1] = newValue
        graphView.setNeedsDisplay()
    }

}
