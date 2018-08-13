//
//  MainViewController.swift
//  ReparaPC
//
//  Created by Javier Cervantes on 14/03/18.
//  Copyright © 2018 Oscod. All rights reserved.
//

import UIKit

class MainViewController: RPBaseViewController {
    
    @IBOutlet weak var clientView: UIView!
    @IBOutlet weak var serviceView: UIView!
    @IBOutlet weak var deviceView: UIView!
    @IBOutlet weak var orderView: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleBarNavigation = RPHelpers.findString("TITLE_MAIN")
        self.setupNavigationBarItems()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
        RPSingleton.configuration.menuBar.isHiddenMenu(isHiddenMenu: true)
        RPSingleton.configuration.optionBar.isHiddenMenu(isHiddenMenu: true)
        self.serviceView.addBorderColor()
        self.clientView.addBorderColor()
        self.deviceView.addBorderColor()
        self.orderView.addBorderColor()
        
    }

    @IBAction func showClientView(_ sender: Any) {
       let indexPath = IndexPath(item: 0, section: 0)
        RPSingleton.configuration.menuBar.collectionView(RPSingleton.configuration.menuBar.collectionView, didSelectItemAt: indexPath)
    }
    

}
