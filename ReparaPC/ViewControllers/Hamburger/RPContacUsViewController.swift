//
//  RPContacUsViewController.swift
//  ReparaPC
//
//  Created by Javier Cervantes on 29/06/18.
//  Copyright © 2018 Oscod. All rights reserved.
//

import UIKit

class RPContacUsViewController: RPBaseViewController {
    
    @IBOutlet weak var nameTxf: UITextField!
    @IBOutlet weak var phoneTxf: UITextField!
    @IBOutlet weak var sendContacBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sendContacBtn.layer.borderColor = UIColor.darkGray.cgColor
        sendContacBtn.layer.borderWidth = 3.0
        sendContacBtn.layer.cornerRadius = 10.0
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        self.titleBarNavigation = "Contactanos"
        self.showBackButon()
        self.navigationController?.isNavigationBarHidden = false
    }
    
    @IBAction func sendContacPressed(_ sender: Any) {
        
    }
    

}
