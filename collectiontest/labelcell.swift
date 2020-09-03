//
//  labelcell.swift
//  collectiontest
//
//  Created by William Finn on 31/08/2020.
//

import UIKit

class labelcell: UICollectionViewCell {
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var leadingLayoutConstrait: NSLayoutConstraint!
    @IBOutlet weak var trailingLayoutConstraint: NSLayoutConstraint!
    
    static let reuseIdentifier = String(describing: labelcell.self)

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        // set the mask in layoutSubviews
        let maskPath = UIBezierPath(roundedRect: bounds,
                                    byRoundingCorners: [.topLeft, .topRight],
                                    cornerRadii: CGSize(width: 12.0, height: 12.0))
        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        layer.mask = shape
    }
    
    func debug(showImage: Bool) {
        if showImage {
            mainLabel.isHidden = true
            mainLabel.text = nil
            imageView.isHidden = false
            leadingLayoutConstrait.constant = 0
            trailingLayoutConstraint.constant = 0
        } else {
            mainLabel.isHidden = false
            imageView.isHidden = true
            leadingLayoutConstrait.constant = 10
            trailingLayoutConstraint.constant = 10
        }
    }
}
