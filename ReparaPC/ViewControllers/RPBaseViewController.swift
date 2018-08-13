//
//  RPBaseViewController.swift
//  ReparaPC
//
//  Created by Javier Cervantes on 07/02/18.
//  Copyright © 2018 Oscod. All rights reserved.
//

import UIKit

class RPBaseViewController: UIViewController {

    var actualController : RPBaseViewController?
    var mainVC : UIViewController? = nil
    var notificationsVC : UIViewController? = nil
    var policyVC : UIViewController? = nil
    var titleBarNavigation:String!
    var nextTrips: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nextTrips = true
        mainVC = HamburgerMenuViewController(nibName:"HamburgerMenuViewController", bundle:nil)
        setupReloadHeader()
        setupNavigationBarItems()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupReloadHeader()
    }
    
    func setupReloadHeader() {
        RPSingleton.configuration.menuBar.baseViewController = self
        RPSingleton.configuration.optionBar.baseViewController = self
        setupMenuBar()
        setupOptionBar()
    }
    
    func goToSection(menuIndex: Int) {
        let indexPath = IndexPath(item: menuIndex, section: 0)
        switch menuIndex {
        case 0:
            let viewController:RPClientViewController = UIStoryboard(name: "Client", bundle: nil).instantiateViewController(withIdentifier: "showRPClientViewController") as! RPClientViewController
            viewController.titleBarNavigation = RPHelpers.findString("TITLE_CLIENT")
            self.navigationController?.pushViewController(viewController, animated: false)
            RPSingleton.configuration.menuBar.horizontalBarView?.isHidden = false
            RPSingleton.configuration.menuBar.collectionView.selectItem(at: indexPath, animated: false, scrollPosition:[])
        case 1:
            let viewController:RPNewClientViewController = UIStoryboard(name: "Client", bundle: nil).instantiateViewController(withIdentifier: "showRPNewClientViewController") as! RPNewClientViewController
            viewController.titleBarNavigation = RPHelpers.findString("TITLE_NEW_CLIENT")
            self.navigationController?.pushViewController(viewController, animated: false)
            RPSingleton.configuration.menuBar.horizontalBarView?.isHidden = false
            RPSingleton.configuration.menuBar.collectionView.selectItem(at: indexPath, animated: false, scrollPosition:[])
        default:
            print("No function available")
        }
    }
    
    func goToOption(menuIndex: Int) {
        
        print("bottom bar")
//        let indexPath = IndexPath(item: menuIndex, section: 0)
//        switch menuIndex {
//        case 0:
//            let viewController:TRoutesViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TRoutes") as! TRoutesViewController
//            viewController.titleBarNavigation = THelpers.findString("TITLE_ROUTES")
//            self.navigationController?.pushViewController(viewController, animated: false)
//            TSingleton.configuration.optionBar.collectionView.selectItem(at: indexPath, animated: false, scrollPosition:[])
//        case 1:
//            let viewController:TSpontaneousTravelerViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TSpontaneous") as! TSpontaneousTravelerViewController
//            viewController.titleBarNavigation = THelpers.findString("TITLE_ROUTES")
//            self.navigationController?.pushViewController(viewController, animated: false)
//            TSingleton.configuration.optionBar.collectionView.selectItem(at: indexPath, animated: false, scrollPosition:[])
//        case 2:
//            let viewController:TCorporateTransporViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TCorporate") as! TCorporateTransporViewController
//            viewController.titleBarNavigation = THelpers.findString("TITLE_ROUTES")
//            self.navigationController?.pushViewController(viewController, animated: false)
//            TSingleton.configuration.optionBar.collectionView.selectItem(at: indexPath, animated: false, scrollPosition:[])
//
//        default:
//            print("No function available")
//        }
    }
    
    public func setupMenuBar() {
        view.addSubview(RPSingleton.configuration.menuBar)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: RPSingleton.configuration.menuBar)
        view.addConstraintsWithFormat(format: "V:|-[v0(80)]|", views: RPSingleton.configuration.menuBar)
    }
    
    public func setupOptionBar() {
        view.addSubview(RPSingleton.configuration.optionBar)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: RPSingleton.configuration.optionBar)
        let model = UIDevice()
        if model.modelName == "iPhone X" {
            view.addConstraintsWithFormat(format: "V:|[v0(135)]|", views: RPSingleton.configuration.optionBar)
        } else {
            view.addConstraintsWithFormat(format: "V:|[v0(110)]|", views: RPSingleton.configuration.optionBar)
        }
    }
    
    public func showBackButon() {
        setupLeftBackNavItems()
    }
    
    public func showBackSpecialButon() {
        setupLeftBackSpecialNavItems()
    }
    
    func showAlert(title: String, message: String, okText: String, cancelText:String , okHandler: ((UIAlertAction) -> Void)? = nil, cancelHandler: ((UIAlertAction) -> Void)? = nil) {
        let alertViewController = UIAlertController(title:title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alertViewController.addAction(UIAlertAction(title: okText, style: UIAlertActionStyle.default, handler: okHandler))
        
        if !cancelText.isEmpty {
            alertViewController.addAction(UIAlertAction(title: cancelText, style: UIAlertActionStyle.default, handler: cancelHandler))
        }
        present(alertViewController, animated: true, completion: nil)
    }
    
    func showAlertLogout(title: String, message: String, okText: String) {
        let alertViewController = UIAlertController(title:title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        alertViewController.addAction(UIAlertAction(title: okText,
                                                    style: UIAlertActionStyle.default,
                                                    handler:{ action in
                                                        self.logoutUser(action: action)
        }))
        present(alertViewController, animated: true, completion: nil)
    }
    
    func logoutUser(action: UIAlertAction) {
        UserDefaults.standard.set(false, forKey: "isLogged")
        UserDefaults.standard.synchronize()
//        BBVALoginIntent.logout()
//        BBVALoginIntent.authorizeUser(in:self, forAppName:"Servicio Médico", with:self, andEnvironment: AU)
    }
    
    func decodeURLToImage(imageName: String)-> UIImage {
        if let imagenUrl =  NSURL(string: imageName) {
            if let imageData = NSData(contentsOf: imagenUrl as URL) {
                return UIImage(data: imageData as Data)!
            }
            return UIImage(named:"no-img")!
        }
        return UIImage(named:"no-img")!
    }

    
    func verifyText(text: String) -> Bool {
        if text.trim().isEmpty {
            return true
        }
        let regEx = ".*[^A-Za-z ].*"
        let predicate = NSPredicate(format:"SELF MATCHES %@", regEx)
        return predicate.evaluate(with: text)
    }
    
    func verifyNumber(number: String) -> Bool {
        if number.trim().isEmpty {
            return true
        }
        let regEx = ".*[^0-9].*"
        let predicate = NSPredicate(format:"SELF MATCHES %@", regEx)
        return predicate.evaluate(with: number)
    }
    
    func verifyEmail(email: String) -> Bool {
        if email.trim().isEmpty {
            return true
        }
        let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format:"SELF MATCHES %@", regEx)
        return predicate.evaluate(with: email)
    }
}
