//
//  PlayerController.swift
//  SimplePlayer
//
//  Created by vanya elizarov on 28/01/18.
//  Copyright © 2018 vanya elizarov. All rights reserved.
//

import UIKit
import RxSwift

class PlayerController: UIViewController {
    
    @IBOutlet var titleLbl: UILabel!
    @IBOutlet var artistLbl: UILabel!
    @IBOutlet var playPauseBtn: UIButton!
    
    var isPlaying: Bool = false
    
    var handle: Handle!
    var rootViewController: RootNavigationController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.semiBlack
        self.playPauseBtn.isEnabled = false
        
        _ = PlayerService.shared.isPlaying
            .subscribe(onNext: { (isPlaying) in
                self.isPlaying = isPlaying
            
                if isPlaying {
                    self.playPauseBtn.setImage(#imageLiteral(resourceName: "IconPause"), for: .normal)
                } else {
                    self.playPauseBtn.setImage(#imageLiteral(resourceName: "IconPlay"), for: .normal)
                }
            })
        
        _ = PlayerService.shared.queue
            .subscribe(onNext: { (song) in
                self.titleLbl.text = song.title
                self.artistLbl.text = song.artist
            
                self.playPauseBtn.isEnabled = true
            })
    }
    
    func prepareView() {
        self.handle = Handle(origin: CGPoint(x: -Handle.barWidth,
                                             y: UIScreen.main.bounds.size.height / 2 - Handle.barHeight / 2))
        self.view.addSubview(self.handle)
    }

    @IBAction func onPlayPauseBtnPress() {
        if self.isPlaying {
            PlayerService.shared.pause()
        } else {
            PlayerService.shared.play()
        }
    }
}
