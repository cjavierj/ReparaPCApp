//
//  RPNewClientViewController.swift
//  ReparaPC
//
//  Created by Javier Cervantes on 31/07/18.
//  Copyright © 2018 Oscod. All rights reserved.
//

import UIKit

class RPNewClientViewController: RPBaseViewController {
    //TextFields
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var postalCodeTextField: UITextField!
    
    //Labels
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var postalCodeLabel: UILabel!
    
    //Views
    @IBOutlet weak var saveView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postalCodeTextField.delegate = self
        phoneNumberTextField.delegate = self
        setupNavigationBar()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        RPSingleton.configuration.menuBar.isHiddenMenu(isHiddenMenu: false)
        saveView.addBorderColor()
    }
    
    private func setupNavigationBar() {
        self.titleBarNavigation = RPHelpers.findString("TITLE_NEW_CLIENT")
        self.showBackSpecialButon()
        self.navigationController?.isNavigationBarHidden = false
    }
    
    @IBAction func saveDataPressed(_ sender: Any) {
        hideLabels()
        var invalidData = false
        if verifyText(text: nameTextField.text!) {
            nameLabel.isHidden = false
            invalidData = true
        }
        if verifyText(text: lastNameLabel.text!) {
            lastNameLabel.isHidden = false
            invalidData = true
        }
        if verifyNumber(number:phoneNumberTextField.text!) {
            phoneNumberLabel.isHidden = false
            invalidData = true
        }
        if verifyNumber(number:postalCodeTextField.text!) {
            postalCodeLabel.isHidden = false
            invalidData = true
        }
        if verifyText(text: cityTextField.text!) {
            cityLabel.isHidden = false
            invalidData = true
        }
        if verifyEmail(email: emailTextField.text!) {
            emailLabel.isHidden = false
            invalidData = true
        }
        if invalidData {
            self.showAlert(title: "Aviso", message: "Los datos del del cliente son invalidos verificalos para continuar", okText: "ok", cancelText: "")
        } else {
            print("send add client")
        }
    }
    
    private func hideLabels() {
        nameLabel.isHidden = true
        lastNameLabel.isHidden = true
        phoneNumberLabel.isHidden = true
        emailLabel.isHidden = true
        cityLabel.isHidden = true
        postalCodeLabel.isHidden = true
    }
    
}

extension RPNewClientViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == postalCodeTextField {
            let maxLength = 5
            let currentString: NSString = textField.text! as NSString
            let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
            return newString.length <= maxLength
        } else if textField == phoneNumberTextField {
            let maxLength = 10
            let currentString: NSString = textField.text! as NSString
            let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
            return newString.length <= maxLength
        }
        return false
    }
    
}
