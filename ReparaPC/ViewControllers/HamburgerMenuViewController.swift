//
//  THamburgerMenuViewController
//  Medical Service
//
//  Created by Javier Cervantes on 13/09/17.
//  Copyright © 2018 Oscod. All rights reserved.
//

import UIKit

class HamburgerMenuViewController: RPBaseViewController {
    
    
    @IBOutlet var infoTopConstraing: NSLayoutConstraint!
    @IBOutlet var optionsbottomConstraing: NSLayoutConstraint!
    
    @IBOutlet var userName: UILabel!
    @IBOutlet var versionLbl: UILabel!
    
    @IBOutlet var photo: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        userName.text = UserDefaults.standard.value(forKey: "user") as? String
        let currentVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
        versionLbl.text =  "Version " +  currentVersion
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
        RPSingleton.configuration.menuBar.isHiddenMenu(isHiddenMenu: true)
        RPSingleton.configuration.optionBar.isHiddenMenu(isHiddenMenu: true)
        UIView.animate(withDuration: 0.70, delay: 0, options: .curveEaseOut, animations: {
            self.infoTopConstraing.constant = 50
            self.optionsbottomConstraing.constant = 0
            self.view.layoutIfNeeded()
        }, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeSideMenu(_ sender: Any) {
        self.closeSideMenu()
    }
    
    @IBAction func goToNotifications(_ sender: UIButton) {
//        let viewController:TNotificationsViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "notifications") as! TNotificationsViewController
//               self.navigationController?.pushViewController(viewController, animated: false)
    }
    
    
    @IBAction func goFrequentQuestionsBtnPressed(_ sender: Any) {
//        let vc = UIStoryboard(name:"Main", bundle:nil).instantiateViewController(withIdentifier:"TGeneralInfo") as? TGeneralInfoViewController
//        vc?.option = 1
//        vc?.titleBarNavigation = THelpers.findString("TITLE_FREQUENT_QUESTIONS")
//        self.navigationController?.pushViewController(vc!, animated:true)
        
    }
    
    @IBAction func logoutBtnPressed(_ sender: Any) {
//        showAlert(title: "Aviso", message: "¿Deseas cerrar sesión?", okText: "Ok", cancelText: "Cancelar",
//                  okHandler: {(action: UIAlertAction) in self.logout(action: action)},
//                  cancelHandler: {(action: UIAlertAction) in self.cancelAction(action: action)})
        
    }
    
    @IBAction func goToTerms(_ sender: UIButton) {
//        let vc = UIStoryboard(name:"Main", bundle:nil).instantiateViewController(withIdentifier:"TGeneralInfo") as? TGeneralInfoViewController
//        vc?.option = 2
//        vc?.titleBarNavigation = THelpers.findString("TITLE_TERMS")
//        self.navigationController?.pushViewController(vc!, animated:true)
    }
    
    func closeSideMenu(){
        UIView.animate(withDuration: 0.70, delay: 0, options: .curveEaseOut, animations: {
            self.infoTopConstraing.constant = 700
            self.optionsbottomConstraing.constant = -500
            self.view.layoutIfNeeded()
        }, completion: nil)
        self.navigationController?.isNavigationBarHidden = false
        RPSingleton.configuration.menuBar.isHiddenMenu(isHiddenMenu: false)
        RPSingleton.configuration.optionBar.isHiddenMenu(isHiddenMenu: false)
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        self.view.window!.layer.add(transition, forKey: kCATransition)
        self.navigationController?.popViewController(animated: true)
    }
    
    func logout(action: UIAlertAction){
        UserDefaults.standard.set(false, forKey: "isLogged")
        UserDefaults.standard.synchronize()
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func cancelAction(action: UIAlertAction){
        RPSingleton.configuration.menuBar.collectionView(RPSingleton.configuration.optionBar.collectionView, didSelectItemAt: IndexPath(item: 0, section: 0))
        RPSingleton.configuration.menuBar.collectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: false, scrollPosition:[])
    }
    
}
