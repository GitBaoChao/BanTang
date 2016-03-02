//
//  HomeBottomView.swift
//  BanTang
//
//  Created by baochao on 16/3/2.
//  Copyright © 2016年 BanTang. All rights reserved.
//

import UIKit

class HomeBottomView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        CGContextMoveToPoint(context, 0, 0)
        CGContextAddArcToPoint(context, ScreenWidth / 2, -20, 0, ScreenWidth, ScreenWidth / 2)
        CGContextStrokePath(context)
    }

}
