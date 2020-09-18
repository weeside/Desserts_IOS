//
//  MacawChartView.swift
//  Desserts
//
//  Created by 김예랑 on 2020/09/18.
//  Copyright © 2020 김예랑. All rights reserved.
//

import Foundation
import Macaw

class MacawChartView: MacawView {
    
    static let thisWeek = createDummyData()
    static let maxValue = 10
    static let maxValueLineHeight = 180
    static let lineWidth: Double = 330
    
    static let dataDivisor = Double(maxValue/maxValueLineHeight)
    static let adjustedData: [Double] = thisWeek.map({ $0.rate / dataDivisor })
    static var animations: [Animation] = []
    
    required init?(coder aDecoder: NSCoder) {
        super.init(node: MacawChartView.createChart(), coder: aDecoder)
        backgroundColor = .clear
    }
    
    private static func createChart() -> Group {
        var items: [Node] = addYAxisItems() + addXAxisItems()
        items.append(createBars())
        
        return Group(contents: items, place: .identity)
    }
    
    private static func addYAxisItems() -> [Node] {
        let maxLines = 5
        let lineInterval = Int(maxValue/maxLines)
        let yAxisHeight: Double = 200
        let lineSpacing: Double = 40
        
        var newNodes: [Node] = []
        
        for i in 1...maxLines {
            let y = yAxisHeight - (Double(i) * lineSpacing)
            
            let valueLine = Line(-5, y, lineWidth, y).stroke(fill:Color.gray.with(a: 0.10))
            let valueText = Text(text: "\(i * lineInterval)", align: .max
                                 , baseline: .mid, place: .move(-10, y))
            valueText.fill = Color.gray
            
            newNodes.append(valueLine)
            newNodes.append(valueText)
        }
        
        let yAxis = Line(0, 0, 0, yAxisHeight).stroke(fill:Color.gray.with(a: 0.25))
        newNodes.append(yAxis)
        
        return newNodes
    }
    
    private static func addXAxisItems() -> [Node] {
        let chartBaseY: Double = 200
        var newNodes: [Node] = []
        
        for i in 1...adjustedData.count {
            let x = (Double(i)) * 50
            let valueText = Text(text: thisWeek[i - 1].weekday, align: .max, baseline: .mid, place: .move(x - 25, chartBaseY + 15))
            valueText.fill = Color.gray
            newNodes.append(valueText)
        }
        
        let xAxis = Line(0, chartBaseY, lineWidth, chartBaseY).stroke(fill:Color.gray.with(a: 0.25))
        newNodes.append(xAxis)
        return newNodes
    }
    
    private static func createBars() -> Group {
        let fill = LinearGradient(degree: 90, from: Color(val: 0xffc7d2), to: Color(val: 0xffc7d2).with(a: 0.33))
        let items = adjustedData.map { _ in Group() }
        
        print("createBars starting")
        animations = items.enumerated().map { (i: Int, item: Group) in
            item.contentsVar.animation(delay: Double(i) * 0.1) { t in
                let height = adjustedData[i] * t
                let rect = Rect(Double(i) * 50 + 25, 200 - height, 30, height)
                return [rect.fill(with: fill)]
            }
        }
        return items.group()
    }
    
    
    static func playAnimations() {
        animations.combine().play()
    }
    
    
    
    private static func createDummyData() -> [WeeklyChart] {
        let one = WeeklyChart(weekday: "월", rate: 3.0)
        let two = WeeklyChart(weekday: "화", rate: 7.0)
        let three = WeeklyChart(weekday: "수", rate: 5.2)
        let four = WeeklyChart(weekday: "목", rate: 10.0)
        let five = WeeklyChart(weekday: "금", rate: 1.1)
        let six = WeeklyChart(weekday: "토", rate: 3.0)
        let seven = WeeklyChart(weekday: "일", rate: 8.0)
        
        return [one, two, three, four, five, six, seven]
    }
}
