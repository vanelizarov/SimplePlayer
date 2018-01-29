//
//  SeekSlider.swift
//  SimplePlayer
//
//  Created by vanya elizarov on 29/01/18.
//  Copyright © 2018 vanya elizarov. All rights reserved.
//

import UIKit

@IBDesignable
class Slider: UISlider {
    
    private var innerThumbSize: CGSize = CGSize(width: 16, height: 16)
    private var innerThumbCornerRadius: CGFloat = 1
        
    @IBInspectable var thumbSize: CGSize {
        set {
            self.innerThumbSize = newValue
            self.setupThumb()
        }
        
        get {
            return self.innerThumbSize
        }
    }
    
    @IBInspectable var thumbCornerRadius: CGFloat {
        set {
            self.innerThumbCornerRadius = newValue
            self.setupThumb()
        }
        
        get {
            return self.innerThumbCornerRadius
        }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    private func getThumbImage() -> UIImage {
        
        UIGraphicsBeginImageContextWithOptions(self.innerThumbSize, false, UIScreen.main.scale)
        
        let ctx: CGContext = UIGraphicsGetCurrentContext()!
        
        ctx.saveGState()
        
        let rect = CGRect(x: 0,
                          y: 0,
                          width: self.innerThumbSize.width,
                          height: self.innerThumbSize.height)
        let clipPath = UIBezierPath(roundedRect: rect,
                                    cornerRadius: self.innerThumbCornerRadius).cgPath
        
        ctx.addPath(clipPath)
        ctx.setFillColor(UIColor.white.cgColor)
        ctx.closePath()
        ctx.fillPath()
        ctx.restoreGState()
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return image!
        
    }
    
    private func setupThumb() {
        let thumbImage = self.getThumbImage()
        
        self.setThumbImage(thumbImage, for: .normal)
        self.setThumbImage(thumbImage, for: .highlighted)
    }
    
    private func commonInit() {
        self.setupThumb()

        self.tintColor = UIColor.primary
    }
    
}
