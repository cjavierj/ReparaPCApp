//
//  ClientTableViewCell.swift
//  ReparaPC
//
//  Created by Javier Cervantes on 17/07/18.
//  Copyright © 2018 Oscod. All rights reserved.
//

import UIKit

class RPClientTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var userPhoneLbl: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
