//
//  RPBaseViewController+navbar.swift
//  ReparaPC
//
//  Created by Javier Cervantes on 13/11/17.
//  Copyright © 2018 Oscod. All rights reserved.
//

import UIKit

extension RPBaseViewController {
    
    func setupNavigationBarItems() {
        setupLeftNavItems()
        setupRemainingNavItems()
    }
    
    private func setupRemainingNavItems() {
        navigationController?.navigationBar.backgroundColor = UIColor.returnRGBColor(r: 0, g: 0, b: 0, alpha: 1)
    }
    
    private func setupLeftNavItems() {
        
        let sideMenuButton = UIButton(type: .system)
        sideMenuButton.setImage(#imageLiteral(resourceName: "hamburgesa").withRenderingMode(.alwaysOriginal), for: .normal)
        sideMenuButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        sideMenuButton.addTarget(self, action: #selector(handleSearch), for: .touchUpInside)
        let textLabel = UILabel()
        if let title = titleBarNavigation {
            textLabel.text = title
        }
        textLabel.frame = CGRect(x: 0, y: 0, width: 180, height: 34)
        textLabel.textColor = UIColor.white
        textLabel.adjustsFontSizeToFitWidth = true
        let spaceView = UIView()
        spaceView.frame = CGRect(x: 0, y: 0, width: 10, height: 34)
        navigationItem.leftBarButtonItems = [UIBarButtonItem(customView: sideMenuButton), UIBarButtonItem(customView: spaceView), UIBarButtonItem(customView: textLabel)]
    }
    
    func setupLeftBackNavItems() {
        let backButton = UIButton(type: .system)
        backButton.setImage(#imageLiteral(resourceName: "icn-arrow-back-white").withRenderingMode(.alwaysOriginal), for: .normal)
        backButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        backButton.addTarget(self, action: #selector(backToView), for: .touchUpInside)
        self.setupNavItems(buttom: backButton)
    }
    
    func setupLeftBackSpecialNavItems() {
        let backButton = UIButton(type: .system)
        backButton.setImage(#imageLiteral(resourceName: "icn-arrow-back-white").withRenderingMode(.alwaysOriginal), for: .normal)
        backButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        backButton.addTarget(self, action: #selector(backToViewSpecial), for: .touchUpInside)
        self.setupNavItems(buttom: backButton)
    }
    
    func setupNavItems(buttom: UIButton) {
        let textLabel = UILabel()
        if let title = titleBarNavigation {
            textLabel.text = title
        }
        textLabel.frame = CGRect(x: 0, y: 0, width: 180, height: 34)
        textLabel.textColor = UIColor.white
        
        let spaceView = UIView()
        spaceView.frame = CGRect(x: 40, y: 0, width: 10, height: 34)
        
        navigationItem.leftBarButtonItems = [UIBarButtonItem(customView: buttom),UIBarButtonItem(customView: spaceView), UIBarButtonItem(customView: textLabel)]
    }
    
    private func setupRightNavItems() {
        let notificationsButton = UIButton(type: .system)
    
        notificationsButton.setImage(self.hasNotifications().withRenderingMode(.alwaysOriginal), for: .normal)
        notificationsButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        notificationsButton.addTarget(self, action: #selector(handleShowNotifications), for: .touchUpInside)
        
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: notificationsButton)]
        
    }
    
    @objc func handleSearch() {
        if let mainvc2 = self.mainVC {
            mainvc2.view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
            let transition = CATransition()
            transition.duration = 0.5
            transition.type = kCATransitionPush
            transition.subtype = kCATransitionFromLeft
            self.view.window!.layer.add(transition, forKey: kCATransition)
            self.navigationController?.pushViewController(mainvc2, animated: false)
        }
    }
    
    
    @objc func handleShowNotifications() {
        
//        if let mainvc2 = self.notificationsVC{
//            mainvc2.view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
//            let transition = CATransition()
//            transition.duration = 0.5
//            transition.type = kCATransitionPush
//            transition.subtype = kCATransitionFromLeft
//            self.view.window!.layer.add(transition, forKey: kCATransition)
//            self.navigationController?.pushViewController(mainvc2, animated: false)
//        }
    }
    
    @objc func handleShowPolicy() {
        
        if let mainvc2 = self.policyVC {
            mainvc2.view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
            let transition = CATransition()
            transition.duration = 0.5
            transition.type = kCATransitionPush
            transition.subtype = kCATransitionFromLeft
            self.view.window!.layer.add(transition, forKey: kCATransition)
            self.navigationController?.pushViewController(mainvc2, animated: false)
        }
    }
    
    @objc func backToView() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func backToViewSpecial(){
        for aViewController in (self.navigationController?.viewControllers.reversed())! {
            if(aViewController.isKind(of: MainViewController.self)){
                self.navigationController!.popToViewController(aViewController, animated: true);
                break
            }
        }
    }
    
    func backToViewSpecialC(){
//        for aViewController in (self.navigationController?.viewControllers.reversed())! {
//            if(aViewController.isKind(of: TCorporateRouteViewController.self)){
//                self.navigationController!.popToViewController(aViewController, animated: true);
//                break
//            }
//        }
    }
    
    func hasNotifications() -> UIImage {
        let image = UIImage(named: "icn-notificaciones-off-white")
        return image!
    }
}

