//
//  PlayerController.swift
//  SimplePlayer
//
//  Created by vanya elizarov on 28/01/18.
//  Copyright © 2018 vanya elizarov. All rights reserved.
//

import UIKit

class PlayerController: UIViewController {
    
    var handle: Handle!
    
    var rootViewController: RootNavigationController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.semiBlack
    }
    
    func prepareView() {
        self.handle = Handle(origin: CGPoint(x: -Handle.barWidth,
                                             y: UIScreen.main.bounds.size.height / 2 - Handle.barHeight / 2))
        self.view.addSubview(self.handle)
    }

}
