//
//  ChartViewController.swift
//  Desserts
//
//  Created by 김예랑 on 2020/09/18.
//  Copyright © 2020 김예랑. All rights reserved.
//

import Macaw

class MyView: MacawView {

    required init?(coder aDecoder: NSCoder) {
        let text = Text(text: "Hello, World!", place: .move(dx: 145, dy: 100))
        super.init(node: text, coder: aDecoder)
    }

}
