//
//  Subject.swift
//  ObserberGraph
//
//  Created by 有村琢磨 on 2016/04/21.
//  Copyright © 2016年 有村琢磨. All rights reserved.
//

import UIKit

@objc
protocol Subject {
    var observers: Array<Observer> { get }
    func add(newObserver: Observer)
    func remove(observer: Observer)
    func observerNotify(newValue: Int)
}

