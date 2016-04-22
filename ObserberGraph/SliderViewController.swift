//
//  SliderView.swift
//  ObserberGraph
//
//  Created by 有村琢磨 on 2016/04/22.
//  Copyright © 2016年 有村琢磨. All rights reserved.
//

import UIKit

class SliderViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    let graphView = GraphView()
    var noOfGraphpoints: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        noOfGraphpoints = graphView.graphPoints.count
        
        slider.maximumValue = 100
        slider.minimumValue = 0
        
        slider.value = Float(graphView.graphPoints[noOfGraphpoints - 1])
        
    }
    
    @IBAction func sliderValue_changed(sender: AnyObject) {
        
        graphView.graphPoints[noOfGraphpoints - 1] = Int(slider.value)
        graphView.observerNotify(graphView.graphPoints[noOfGraphpoints - 1])
    }
}
