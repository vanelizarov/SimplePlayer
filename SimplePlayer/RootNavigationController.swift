//
//  RootNavigationController.swift
//  SimplePlayer
//
//  Created by vanya elizarov on 28/01/18.
//  Copyright © 2018 vanya elizarov. All rights reserved.
//

import UIKit

class RootNavigationController: UINavigationController {
    
    var disableInteractivePlayerTranstioning = false
    
    var handle: Handle!
    var playerController: PlayerController!
    var presentInteractor: PlayerViewInteractive!
    var dismissInteractor: PlayerViewInteractive!


    override func viewDidLoad() {
        super.viewDidLoad()

        self.prepareView()
    }

    func prepareView() {
        self.handle = Handle(origin: CGPoint(x: self.view.frame.width - Handle.barWidth,
                                             y: UIScreen.main.bounds.size.height / 2 - Handle.barHeight / 2))
        self.view.addSubview(self.handle)
        
        self.playerController = PlayerController(nibName: "PlayerController", bundle: nil)
        self.playerController.rootViewController = self
        self.playerController.transitioningDelegate = self
        self.playerController.modalPresentationStyle = .fullScreen
        self.playerController.prepareView()
        
        self.presentInteractor = PlayerViewInteractive()
        self.presentInteractor.attach(to: self, with: self.handle, present: self.playerController)
        self.dismissInteractor = PlayerViewInteractive()
        self.dismissInteractor.attach(to: self.playerController, with: self.playerController!.handle, present: nil)
        
        self.navigationBar.barTintColor = UIColor.primary
        self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
    }

}

extension RootNavigationController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController,
                             presenting: UIViewController,
                             source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let animator = PlayerViewAnimator()
        animator.initialX = Handle.barWidth
        animator.transitionType = .present
        
        return animator
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let animator = PlayerViewAnimator()
        animator.initialX = Handle.barWidth
        animator.transitionType = .dismiss
        
        return animator
    }
    
    func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        guard !self.disableInteractivePlayerTranstioning else { return nil }
        
        return self.presentInteractor
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        guard !self.disableInteractivePlayerTranstioning else { return nil }
        
        return self.dismissInteractor
    }
}




















