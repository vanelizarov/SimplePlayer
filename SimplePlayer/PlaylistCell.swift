//
//  PlaylistCell.swift
//  SimplePlayer
//
//  Created by vanya elizarov on 05/02/18.
//  Copyright © 2018 vanya elizarov. All rights reserved.
//

import UIKit

class PlaylistCell: UITableViewCell {

    @IBOutlet var artwork: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var artist: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.accessoryType = .disclosureIndicator
        
        let path = UIBezierPath(roundedRect: self.artwork.bounds,
                                byRoundingCorners: [.allCorners],
                                cornerRadii: CGSize(width: 2, height: 2))
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        self.artwork.layer.mask = maskLayer
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
