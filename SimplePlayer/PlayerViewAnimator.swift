//
//  HandleToPlayerViewAnimator.swift
//  SimplePlayer
//
//  Created by vanya elizarov on 28/01/18.
//  Copyright © 2018 vanya elizarov. All rights reserved.
//

import UIKit

class PlayerViewAnimator: BaseAnimator {
    
    var initialX: CGFloat = 0
    
    override func animatePresenting(inContext transitionContext: UIViewControllerContextTransitioning,
                                    from fromVC: UIViewController,
                                    to toVC: UIViewController) {
        
        let fromRect = transitionContext.initialFrame(for: fromVC)
        var toRect = fromRect
        toRect.origin.x = toRect.size.width
        toVC.view.frame = toRect

        let container = transitionContext.containerView
        container.addSubview(fromVC.view)
        container.addSubview(toVC.view)
        
        let animationOptions: UIViewAnimationOptions = transitionContext.isInteractive ? [.curveLinear] : []
        
        UIView.animate(
            withDuration: self.transitionDuration(using: transitionContext),
            delay: 0,
            options: animationOptions,
            animations: { 
                toVC.view.frame = fromRect
            }
        ) { (finished) in
            
            if transitionContext.transitionWasCancelled {
                transitionContext.completeTransition(false)
            } else {
                transitionContext.completeTransition(true)
                
                (toVC as! PlayerController).handle.turnRight()
                (toVC as! PlayerController).handle.frame.origin.x = 0
            }
        }
    }
    
    override func animateDismissing(inContext transitionContext: UIViewControllerContextTransitioning,
                                   from fromVC: UIViewController,
                                   to toVC: UIViewController) {
        
        var fromRect = transitionContext.initialFrame(for: fromVC)
        fromRect.origin.x = fromRect.size.width
        
        let container = transitionContext.containerView
        container.addSubview(toVC.view)
        container.addSubview(fromVC.view)
        
        let animationOptions: UIViewAnimationOptions = transitionContext.isInteractive ? [.curveLinear] : []
        
        UIView.animate(
            withDuration: self.transitionDuration(using: transitionContext),
            delay: 0,
            options: animationOptions,
            animations: {
                fromVC.view.frame = fromRect
            }
        ) { (finished) in
            
            if transitionContext.transitionWasCancelled {
                transitionContext.completeTransition(false)
            } else {
                transitionContext.completeTransition(true)
                
                (fromVC as! PlayerController).handle.turnLeft()
                (fromVC as! PlayerController).handle.frame.origin.x = -Handle.barWidth
            }
        }
    }
    
    override func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return transitionContext!.isInteractive ? 0.4 : 0.3
    }

}
