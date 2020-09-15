//
//  QuestionViewController.swift
//  Desserts
//
//  Created by 김예랑 on 2020/09/13.
//  Copyright © 2020 김예랑. All rights reserved.
//

import Foundation
import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        noButton.layer.cornerRadius = 15
        yesButton.layer.cornerRadius = 15
        let attributedString = NSMutableAttributedString(string: "내일 하루가\n더욱 기대되나요? 😎", attributes: [
          .font: UIFont(name: "SpoqaHanSans-Bold", size: 36.0)!,
          .foregroundColor: UIColor(white: 0.0, alpha: 1.0)
        ])
        questionLabel.attributedText = attributedString
    }

}

