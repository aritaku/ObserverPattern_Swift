//
//  GraphView.swift
//  ObserberGraph
//
//  Created by 有村琢磨 on 2016/04/12.
//  Copyright © 2016年 有村琢磨. All rights reserved.
//

import UIKit

@IBDesignable
class GraphView: UIView {
    
    var graphPoints:[Int] = [4, 2, 5, 6, 2, 9, 5]

    override func drawRect(rect: CGRect) {
        
        //設定
        let width = rect.width
        let height = rect.height
        
        let margin: CGFloat = 20.0
        let columnXPoint = {(column: Int) -> CGFloat in
            let spacer = (width - margin*2 - 4) / CGFloat(self.graphPoints.count - 1)
            var x: CGFloat = CGFloat(column) * spacer
            x += margin + 2
            return x
        }
        
        let topBorder:CGFloat = 60
        let bottomBorder:CGFloat = 50
        let graphHeight = height - topBorder - bottomBorder
        let maxValue = graphPoints.maxElement()
        let columnYPoint = { (graphPoint:Int) -> CGFloat in
            var y:CGFloat = CGFloat(graphPoint) / CGFloat(maxValue!) * graphHeight
            y = graphHeight + topBorder - y
            return y
        }
        
        //グラフの描画
        let graphPath = UIBezierPath()
        graphPath.moveToPoint(CGPoint(x:columnXPoint(0),
            y:columnYPoint(graphPoints[0])))

        for i in 1..<graphPoints.count {
            let nextPoint = CGPoint(x:columnXPoint(i),
                                    y:columnYPoint(graphPoints[i]))
            graphPath.addLineToPoint(nextPoint)
        }
        
        let clippingPath = graphPath.copy() as! UIBezierPath

        let highestYPoint = columnYPoint(maxValue!)
        
        
        //draw the line on top of the clipped gradient
        graphPath.lineWidth = 2.0
        graphPath.stroke()
        
        //Draw the circles on top of graph stroke
        for i in 0..<graphPoints.count {
            var point = CGPoint(x:columnXPoint(i), y:columnYPoint(graphPoints[i]))
            point.x -= 5.0/2
            point.y -= 5.0/2
            
            let circle = UIBezierPath(ovalInRect:
                CGRect(origin: point,
                    size: CGSize(width: 5.0, height: 5.0)))
            circle.fill()
        }
        
        

        //グラフ背景の横線
        let linePath = UIBezierPath()
        
        //top line
        linePath.moveToPoint(CGPoint(x:margin, y: topBorder))
        linePath.addLineToPoint(CGPoint(x: width - margin,
            y:topBorder))
        
        //center line
        linePath.moveToPoint(CGPoint(x:margin,
            y: graphHeight/2 + topBorder))
        linePath.addLineToPoint(CGPoint(x:width - margin,
            y:graphHeight/2 + topBorder))
        
        //bottom line
        linePath.moveToPoint(CGPoint(x:margin,
            y:height - bottomBorder))
        linePath.addLineToPoint(CGPoint(x:width - margin,
            y:height - bottomBorder))

        let color = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        color.setStroke()
        
        linePath.lineWidth = 1.0
        linePath.stroke()
        
        
    }

}
