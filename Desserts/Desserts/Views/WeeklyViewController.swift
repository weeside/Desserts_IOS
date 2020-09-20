//
//  WeeklyViewController.swift
//  Desserts
//
//  Created by 김예랑 on 2020/09/14.
//  Copyright © 2020 김예랑. All rights reserved.
//

import Foundation
import UIKit

class WeeklyViewController: UIViewController {

    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet private var chartView: MacawChartView!
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        
        // 하단 string은 API에서 받아오는 것으로 교체될 예정
        let attributedString = NSMutableAttributedString(string: "요 며칠\n우울해 보였는데 😢\n오늘은 기분이 좋아 보여서\n다행이에요. ☺️", attributes: [
          .font: UIFont(name: "SpoqaHanSans-Bold", size: 32.0)!,
          .foregroundColor: UIColor(white: 0.0, alpha: 1.0)
        ])
        commentLabel.attributedText = attributedString
        
        chartView.contentMode = .scaleAspectFit
        
//        MacawChartView.playAnimations()
    }
    
    @IBAction func monthlyButtonPressed(_ sender: UIButton) {
//        MacawChartView.playAnimations()
    }
}
