//
//  BaseAnimator.swift
//  SimplePlayer
//
//  Created by vanya elizarov on 28/01/18.
//  Copyright © 2018 vanya elizarov. All rights reserved.
//

import UIKit

enum ModalAnimatedTransitioningType {
    case present
    case dismiss
}

class BaseAnimator: NSObject {
    var transitionType: ModalAnimatedTransitioningType = .present
    
    func animatePresenting(inContext transitionContext: UIViewControllerContextTransitioning,
                          from fromVC: UIViewController,
                          to toVC: UIViewController) {
        NSException(
            name: .internalInconsistencyException,
            reason: "\(#function) must be overriden in a subclass",
            userInfo: nil).raise()
    }
    
    func animateDismissing(inContext transitionContext: UIViewControllerContextTransitioning,
                           from fromVC: UIViewController,
                           to toVC: UIViewController) {
        NSException(
            name: .internalInconsistencyException,
            reason: "\(#function) must be overriden in a subclass",
            userInfo: nil).raise()
    }
}

extension BaseAnimator: UIViewControllerAnimatedTransitioning {
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let from = transitionContext.viewController(forKey: .from)
        let to = transitionContext.viewController(forKey: .to)
        
        if let from = from, let to = to {
            switch transitionType {
            case .present:
                self.animatePresenting(inContext: transitionContext, from: from, to: to)
            case .dismiss:
                self.animateDismissing(inContext: transitionContext, from: from, to: to)
            }
        }
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        NSException(
            name: .internalInconsistencyException,
            reason: "\(#function) must be overriden in a subclass",
            userInfo: nil).raise()
        
        return 0
    }
    
}
