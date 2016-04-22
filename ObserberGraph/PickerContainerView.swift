//
//  PickerContainerView.swift
//  ObserberGraph
//
//  Created by 有村琢磨 on 2016/04/22.
//  Copyright © 2016年 有村琢磨. All rights reserved.
//

import UIKit

class PickerContainerView: UIView, Observer {
    
    let graphView = GraphView()
    let pickerVC = PickerViewController()

    func update(newValue: Int) {
        pickerVC.pickerView.selectRow(newValue - 1, inComponent: 0, animated: true)
        graphView.setNeedsDisplay()
    }

}
