//
//  TMenuCell.swift
//  Transporte
//
//  Created by Javier Cervantes on 13/11/17.
//  Copyright © 2017 IDS Comercial. All rights reserved.
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
    
    override var isHighlighted: Bool{
        didSet{
            imageView.tintColor = UIColor.white
            labelText.textColor = UIColor.white
        }
    }
    
    override var isSelected: Bool{
        didSet{
            switch position {
            case 0:
                imageView.tintColor = isSelected ? UIColor.returnRGBColor(r: 46, g: 203, b: 205, alpha: 1) : UIColor.white
                labelText.textColor  = isSelected ? UIColor.returnRGBColor(r: 46, g: 203, b: 205, alpha: 1) : UIColor.white
            case 1:
                imageView.tintColor = isSelected ? UIColor.returnRGBColor(r: 198, g: 183, b: 255, alpha: 1) : UIColor.white
                labelText.textColor  = isSelected ? UIColor.returnRGBColor(r: 198, g: 183, b: 255, alpha: 1) : UIColor.white
            case 2:
                imageView.tintColor = isSelected ? UIColor.returnRGBColor(r: 216, g: 190, b: 118, alpha: 1) : UIColor.white
                labelText.textColor  = isSelected ? UIColor.returnRGBColor(r: 216, g: 190, b: 118, alpha: 1) : UIColor.white
            default:
                break
            }
            backgroundColor = isSelected ?  UIColor.returnRGBColor(r: 42, g: 134, b: 202, alpha: 0.60) : UIColor.returnRGBColor(r: 7, g: 33, b: 70, alpha: 1)
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

