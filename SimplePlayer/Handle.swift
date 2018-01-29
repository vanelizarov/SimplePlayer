//
//  Handle.swift
//  SimplePlayer
//
//  Created by vanya elizarov on 28/01/18.
//  Copyright © 2018 vanya elizarov. All rights reserved.
//

import UIKit

@IBDesignable
class Handle: UIView {
    
    static let barWidth: CGFloat = 16
    static let barHeight: CGFloat = 60
    
    var icon: UIImageView!
    
    init(origin: CGPoint) {
        let size = CGSize(width: Handle.barWidth, height: Handle.barHeight)
        super.init(frame: CGRect(origin: origin, size: size))
        self.commonInit()
    }
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    internal required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    func turnRight() {
        self.transform = CGAffineTransform(scaleX: -1, y: 1)
    }
    
    func turnLeft() {
        self.transform = CGAffineTransform(scaleX: 1, y: 1)
    }
    
    private func commonInit() {
        let path = UIBezierPath(roundedRect: self.bounds,
                                byRoundingCorners: [.topLeft, .bottomLeft],
                                cornerRadii: CGSize(width: 4, height: 4))
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        self.layer.mask = maskLayer
        
        self.backgroundColor = UIColor.textPrimary
        
        self.icon = UIImageView(frame: CGRect(x: 0,
                                              y: Handle.barHeight / 2 - Handle.barWidth / 2,
                                              width: Handle.barWidth,
                                              height: Handle.barWidth))
        self.icon.image = #imageLiteral(resourceName: "IconArrowLeft")
        self.icon.tintColor = UIColor.white
        self.addSubview(self.icon)
    }
    
}
