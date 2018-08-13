//
//  RPMenuCell.swift
//  ReparaPC
//
//  Created by Javier Cervantes on 31/07/18.
//  Copyright © 2018 Oscod. All rights reserved.
//

import UIKit

class RPMenuCell : RPBaseCell{
    
    var position : Int = 0
    
    var imageView:UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    var labelText:UILabel = {
        let lbt = UILabel()
        lbt.font = UIFont.boldSystemFont(ofSize: 10.0)
        lbt.translatesAutoresizingMaskIntoConstraints = false
        return lbt
    }()
    
    override var isHighlighted: Bool {
        didSet {
            imageView.tintColor = UIColor.white
            labelText.textColor = UIColor.white
        }
    }
    
    override var isSelected: Bool{
        didSet {
            switch position {
            case 0:
                imageView.tintColor = isSelected ? UIColor.returnRGBColor(r: 138, g: 149, b: 151, alpha: 1) : UIColor.white
                labelText.textColor  = isSelected ? UIColor.returnRGBColor(r: 138, g: 149, b: 151, alpha: 1) : UIColor.white
            case 1:
                imageView.tintColor = isSelected ? UIColor.returnRGBColor(r: 138, g: 149, b: 151, alpha: 1) : UIColor.white
                labelText.textColor  = isSelected ? UIColor.returnRGBColor(r: 138, g: 149, b: 151, alpha: 1) : UIColor.white
            default:
                break
            }
            backgroundColor = isSelected ?  UIColor.returnRGBColor(r: 52, g: 73, b: 94, alpha: 0.60) : UIColor.returnRGBColor(r: 0, g: 0, b: 0, alpha: 1)
        }
    }
    
    override func setUpViews() {
        super.setUpViews()
        addSubview(imageView)
        addSubview(labelText)
        addConstraintsWithFormat(format: "H:[v0(28)]", views: imageView)
        addConstraintsWithFormat(format: "V:[v0(28)]", views: imageView)
        addConstraintsWithFormat(format: "H:[v0]", views: labelText)
        addConstraintsWithFormat(format: "V:[v0(20)]", views: labelText)
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: labelText, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: labelText, attribute: .bottom, relatedBy: .equal, toItem: imageView, attribute: .bottom, multiplier: 1, constant: 20))
    }
}

