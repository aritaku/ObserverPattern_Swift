//
//  SliderContainerView.swift
//  ObserberGraph
//
//  Created by 有村琢磨 on 2016/04/22.
//  Copyright © 2016年 有村琢磨. All rights reserved.
//

import UIKit

class SliderContainerView: UIView, Observer {
    
    let sliderViewController = SliderViewController()
    let graphView = GraphView()

    func update(newValue: Int) {
        sliderViewController.slider.value = Float(newValue)
        graphView.setNeedsDisplay()
    }

}
