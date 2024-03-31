//
//  gridCollectionViewCell.swift
//  Appsinvo
//
//  Created by Ajay Kumar on 30/03/24.
//

import UIKit

class gridCollectionViewCell: UICollectionViewCell {
        
    @IBOutlet weak var imageBackgroundView: UIView!
    @IBOutlet weak var gridImageView: UIImageView!
    @IBOutlet weak var gridName: UILabel!
    
    
    override func awakeFromNib() {
            super.awakeFromNib()
            
            imageBackgroundView.layer.cornerRadius = 10
            imageBackgroundView.clipsToBounds = true
        }
    
    
}
