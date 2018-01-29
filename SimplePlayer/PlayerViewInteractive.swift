//
//  HandleToPlayerViewInteractive.swift
//  SimplePlayer
//
//  Created by vanya elizarov on 28/01/18.
//  Copyright © 2018 vanya elizarov. All rights reserved.
//

import UIKit

class PlayerViewInteractive: UIPercentDrivenInteractiveTransition {
    
    var viewController: UIViewController?
    var presentViewController: UIViewController?
    var pan: UIPanGestureRecognizer!
    
    var shouldComplete = false
    var lastProgress: CGFloat?
    
    func attach(to viewController: UIViewController, with view: UIView, present presentViewController: UIViewController?) {
        self.viewController = viewController
        self.presentViewController = presentViewController
                
        self.pan = UIPanGestureRecognizer(target: self, action: #selector(self.onPan(_:)))
        view.addGestureRecognizer(pan)
    }
    
    func onPan(_ pan: UIPanGestureRecognizer) {
        let translation = pan.translation(in: pan.view?.superview)
        
        let percentThreshold: CGFloat = 0.2
        let automaticOverrideThreshold: CGFloat = 0.03
        
        let screenWidth: CGFloat = UIScreen.main.bounds.size.width - Handle.barWidth
        let dragAmount: CGFloat = (self.presentViewController == nil) ? screenWidth : -screenWidth
        var progress: CGFloat = translation.x / dragAmount
        
        progress = fmax(progress, 0)
        progress = fmin(progress, 1)
        
        switch pan.state {
        case .began:
            if let presentViewController = self.presentViewController {
                self.viewController?.present(presentViewController, animated: true, completion: nil)
            } else {
                self.viewController?.dismiss(animated: true, completion: nil)
            }
            
        case .changed:
            guard let lastProgress = self.lastProgress else { return }
            
            if lastProgress > progress {
                shouldComplete = false
            } else if progress > lastProgress + automaticOverrideThreshold {
                shouldComplete = true
            } else {
                shouldComplete = progress > percentThreshold
            }
            
            self.update(progress)
            
        case .ended, .cancelled:
            if pan.state == .cancelled || self.shouldComplete == false {
                self.cancel()
            } else {
                self.finish()
            }
            
        default:
            break
        }
        
        self.lastProgress = progress
    }
}
