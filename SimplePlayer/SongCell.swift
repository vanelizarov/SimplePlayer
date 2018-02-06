//
//  SongCell.swift
//  SimplePlayer
//
//  Created by vanya elizarov on 06/02/18.
//  Copyright © 2018 vanya elizarov. All rights reserved.
//

import UIKit
import RxSwift

class SongCell: UITableViewCell {
    
    private (set) var isPlaying = false
    private (set) var isActive = false
    
    private var playingSubscription: Disposable!

    @IBOutlet var playPauseBtn: UIButton!
    @IBOutlet var editBtn: UIButton!
    @IBOutlet var artwork: UIImageView!
    
    @IBOutlet var title: UILabel!
    @IBOutlet var artist: UILabel!
    @IBOutlet var timing: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let artworkPath = UIBezierPath(roundedRect: self.artwork.bounds,
                                       byRoundingCorners: [.allCorners],
                                       cornerRadii: CGSize(width: 2, height: 2))
        let artworkMaskLayer = CAShapeLayer()
        artworkMaskLayer.path = artworkPath.cgPath
        self.artwork.layer.mask = artworkMaskLayer
        
        let playPauseBtnPath = UIBezierPath(roundedRect: self.playPauseBtn.bounds.insetBy(dx: 6, dy: 6),
                                            byRoundingCorners: [.allCorners],
                                            cornerRadii: CGSize(width: 16, height: 16))
        let playPauseBtnMaskLayer = CAShapeLayer()
        playPauseBtnMaskLayer.path = playPauseBtnPath.cgPath
        self.playPauseBtn.layer.mask = playPauseBtnMaskLayer
        self.playPauseBtn.layer.zPosition = 999.0
        self.playPauseBtn.isHidden = true
    }
    
    @IBAction func onPlayPauseBtnPress() {
        if (self.isPlaying) {
            PlayerService.shared.pause()
        } else {
            PlayerService.shared.play()
        }
    }
    
    func activate() {
        self.isActive = true
        self.playPauseBtn.isHidden = false
        
        self.playingSubscription = PlayerService.shared.isPlaying
            .subscribe(onNext: { (isPlaying) in
                self.isPlaying = isPlaying
                
                if isPlaying {
                    self.setPlayingState()
                } else {
                    self.setPausedState()
                }
            })
        
        self.setPlayingState()
    }
    
    func deactivate() {
        self.isActive = false
        self.setPausedState()
        self.playPauseBtn.isHidden = true
        
        if let sub = self.playingSubscription {
            sub.dispose()
        }
    }
    
    func setPausedState() {
        self.playPauseBtn.setImage(#imageLiteral(resourceName: "IconPlayFilled"), for: .normal)
        self.playPauseBtn.imageEdgeInsets = UIEdgeInsets(top: 14, left: 15, bottom: 14, right: 13)
    }
    
    func setPlayingState() {
        self.playPauseBtn.setImage(#imageLiteral(resourceName: "IconPauseFilled"), for: .normal)
        self.playPauseBtn.imageEdgeInsets = UIEdgeInsets(top: 14, left: 14, bottom: 14, right: 14)
    }
}











