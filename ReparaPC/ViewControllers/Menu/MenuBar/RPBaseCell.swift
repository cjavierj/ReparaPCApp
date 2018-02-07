//
//  TBaseCell.swift
//  Transporte
//
//  Created by Javier Cervantes on 13/11/17.
//  Copyright © 2017 IDS Comercial. All rights reserved.
//

import UIKit

class RPBaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    func setUpViews(){
        //func to edit view in descendents cells
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
