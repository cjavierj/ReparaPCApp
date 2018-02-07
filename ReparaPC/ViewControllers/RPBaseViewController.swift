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
        // Do any additional setup after loading the view, typically from a nib.
//        mainVC = THamburgerMenuViewController(nibName:"THamburgerMenuViewController", bundle:nil)
//        notificationsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "notifications") as! TNotificationsViewController
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
    
    func setupReloadHeader()
    {
        RPSingleton.configuration.menuBar.baseViewController = self
        RPSingleton.configuration.optionBar.baseViewController = self
        setupMenuBar()
        setupOptionBar()
    }
    
    func goToSection(menuIndex: Int)
    {
//        let indexPath = IndexPath(item: menuIndex, section: 0)
//        switch menuIndex {
//        case 0:
//            let viewController:TMyTripsViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TMyTrips") as! TMyTripsViewController
//            viewController.titleBarNavigation = THelpers.findString("TITLE_TRIPS")
//            self.navigationController?.pushViewController(viewController, animated: false)
//            TSingleton.configuration.menuBar.horizontalBarView?.isHidden = false
//            TSingleton.configuration.menuBar.collectionView.selectItem(at: indexPath, animated: false, scrollPosition:[])
//        case 1:
//            self.nextTrips = true
//            TSingleton.configuration.menuBar.horizontalBarView?.isHidden = false
//            TSingleton.configuration.optionBar.collectionView(TSingleton.configuration.optionBar.collectionView, didSelectItemAt: IndexPath(item: 0, section: 0))
//            TSingleton.configuration.menuBar.collectionView.selectItem(at: indexPath, animated: false, scrollPosition:[])
//        case 2:
//            self.nextTrips = true
//            let viewController:TProfileViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TProfile") as! TProfileViewController
//            viewController.titleBarNavigation = THelpers.findString("TITLE_PROFILE" )
//            self.navigationController?.pushViewController(viewController, animated: false)
//            TSingleton.configuration.menuBar.horizontalBarView?.isHidden = false
//            TSingleton.configuration.menuBar.collectionView.selectItem(at: indexPath, animated: false, scrollPosition:[])
//        default:
//            print("No function available")
//        }
    }
    
    func goToOption(menuIndex: Int){
        
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
    
    public func setupMenuBar(){
        view.addSubview(RPSingleton.configuration.menuBar)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: RPSingleton.configuration.menuBar)
        view.addConstraintsWithFormat(format: "V:|-[v0(80)]|", views: RPSingleton.configuration.menuBar)
    }
    
    public func setupOptionBar(){
        view.addSubview(RPSingleton.configuration.optionBar)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: RPSingleton.configuration.optionBar)
        let model = UIDevice()
        if model.modelName == "iPhone X"{
            view.addConstraintsWithFormat(format: "V:|[v0(135)]|", views: RPSingleton.configuration.optionBar)
        }else{
            view.addConstraintsWithFormat(format: "V:|[v0(110)]|", views: RPSingleton.configuration.optionBar)
        }
    }
    
    public func showBackButon()
    {
        setupLeftBackNavItems()
    }
    
    public func showBackSpecialButon()
    {
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
    
    func showAlertLogout(title: String, message: String, okText: String){
        let alertViewController = UIAlertController(title:title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        alertViewController.addAction(UIAlertAction(title: okText,
                                                    style: UIAlertActionStyle.default,
                                                    handler:{ action in
                                                        self.logoutUser(action: action)
        }))
        present(alertViewController, animated: true, completion: nil)
    }
    
    func logoutUser(action: UIAlertAction){
        UserDefaults.standard.set(false, forKey: "isLogged")
        UserDefaults.standard.synchronize()
//        BBVALoginIntent.logout()
//        BBVALoginIntent.authorizeUser(in:self, forAppName:"Servicio Médico", with:self, andEnvironment: AU)
    }
    
    func decodeURLToImage(imageName: String)-> UIImage{
        if let imagenUrl =  NSURL(string: imageName){
            if let imageData = NSData(contentsOf: imagenUrl as URL){
                return UIImage(data: imageData as Data)!
            }
            return UIImage(named:"no-img")!
        }
        return UIImage(named:"no-img")!
    }
    
    func getRideType(ride: String)-> UIImage{
        var image: UIImage
        switch ride {
        case RPConstants.CodeRide.codeC:
            image = (UIImage(named:"icn-v-corp"))!
        case RPConstants.CodeRide.codeI:
            image = (UIImage(named:"icn-v-intersede"))!
        default:
            image = (UIImage(named:"icn-v-corp"))!
        }
        return image
    }


}
