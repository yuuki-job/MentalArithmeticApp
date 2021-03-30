//
//  CollectionViewCell.swift
//  FlashMentalArithmetic
//
//  Created by 徳永勇希 on 2021/03/24.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var roundView: UIView!
    @IBOutlet weak var displayLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(level: String) {
        roundView.layer.cornerRadius = 20
        roundView.layer.shadowColor = UIColor.black.cgColor
        roundView.layer.shadowOpacity = 1
        roundView.layer.shadowRadius = 5
        displayLabel.text = level
    }
}
