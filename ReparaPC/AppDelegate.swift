//
//  AppDelegate.swift
//  ReparaPC
//
//  Created by Javier Cervantes on 07/02/18.
//  Copyright © 2018 Oscod. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        RPSingleton.configuration.menuBar = {
            let mb = RPMenuBar()
            return mb
        }()
        
        RPSingleton.configuration.optionBar = {
            let ob = RPOptionBar()
            return ob
        }()
        let viewController = configureInitViewController()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        window?.rootViewController = UINavigationController(rootViewController: viewController)
        
        UINavigationBar.appearance().barTintColor = UIColor.returnRGBColor(r: 0, g: 0, b: 0, alpha: 1)
        
        // get rid of black bar underneath navbar
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        
        application.statusBarStyle = .lightContent
        
        let statusBarBackgroundView = UIView()
        statusBarBackgroundView.backgroundColor = UIColor.returnRGBColor(r: 0, g: 0, b: 0, alpha: 1)
        
        window?.addSubview(statusBarBackgroundView)
        window?.addConstraintsWithFormat(format:"H:|[v0]|", views: statusBarBackgroundView)
        let model = UIDevice()
        if model.modelName == "iPhone X"{
            window?.addConstraintsWithFormat(format: "V:|[v0(50)]", views: statusBarBackgroundView)
        }else{
            window?.addConstraintsWithFormat(format: "V:|[v0(20)]", views: statusBarBackgroundView)
        }
        
        RPSingleton.configuration.theme = RPThemeManager(brand: .RPTheme)
        
        IQKeyboardManager.sharedManager().enable = true
        IQKeyboardManager.sharedManager().toolbarDoneBarButtonItemText = "Cerrar"
        
        // Ask for Authorization from the User
        //        if (locService == nil )
        //        {
        //            locService = TLocationService()
        //        }
        //        locService?.enableLocationManager()
        UserDefaults.standard.setValue(false, forKey:"_UIConstraintBasedLayoutLogUnsatisfiable")
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func configureInitViewController() -> UIViewController{
        let noFirstOpen = UserDefaults.standard.bool(forKey:"noFirstOpen")
        var viewController:UIViewController!
        if (!noFirstOpen){
            viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "View") as! LoginViewController
        }else{
            viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "View") as! LoginViewController

        }
        
        
        return viewController
    }

}

