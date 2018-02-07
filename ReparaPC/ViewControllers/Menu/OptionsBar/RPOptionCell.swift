//
//  TOptionCell.swift
//  Transporte
//
//  Created by Javier Cervantes on 13/11/17.
//  Copyright © 2017 IDS Comercial. All rights reserved.
//

import UIKit

class RPOptionCell : RPBaseCell{
    
    var position : Int = 0
    
    var labelText:UILabel =
    {
        let lbt = UILabel()
        lbt.font = UIFont.systemFont(ofSize: 14.0)
        lbt.translatesAutoresizingMaskIntoConstraints = false
        return lbt
    }()
    
    override var isHighlighted: Bool{
        didSet{
            labelText.textColor = isHighlighted ? UIColor.color(fromHexString: "#2dcccd") : UIColor.color(fromHexString: "#004481")
            labelText.textAlignment = .center
            labelText.adjustsFontSizeToFitWidth = true
            labelText.font = isHighlighted ? UIFont.systemFont(ofSize: 16.0) : UIFont.systemFont(ofSize: 14.0)
        }
    }
    
    override var isSelected: Bool{
        didSet{
            labelText.textColor  = isSelected ? UIColor.color(fromHexString: "#2dcccd") : UIColor.color(fromHexString: "#004481")
            labelText.font = isSelected ? UIFont.systemFont(ofSize: 16.0) : UIFont.systemFont(ofSize: 14.0)
        }
    }
    
    override func setUpViews() {
        super.setUpViews()
        addSubview(labelText)
        addConstraintsWithFormat(format: "H:|[v0]|", views: labelText)
        addConstraintsWithFormat(format: "V:|-70-[v0]|", views: labelText)
        addConstraint(NSLayoutConstraint(item: labelText, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: labelText, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
    }
}

