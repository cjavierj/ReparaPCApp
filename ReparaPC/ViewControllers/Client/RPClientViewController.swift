//
//  RPClientViewController.swift
//  ReparaPC
//
//  Created by Javier Cervantes on 17/07/18.
//  Copyright © 2018 Oscod. All rights reserved.
//

import UIKit

class RPClientViewController: RPBaseViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var clientTable: UITableView!
    @IBOutlet weak var customPickerContainer: UIView!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var searchBtn: UIButton!
    
    var customPickerView: CustomPickerViewController!
    //MARK: - SetupView
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        customPickerView = CustomPickerViewController(nibName:"CustomPickerView", bundle:nil)
        customPickerView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupTableView()
        RPSingleton.configuration.menuBar.isHiddenMenu(isHiddenMenu: false)
        searchBtn.layer.cornerRadius = 5
        searchBtn.layer.borderWidth = 1
        searchBtn.layer.borderColor = UIColor.black.cgColor
    }
    
    private func setupNavigationBar() {
        self.titleBarNavigation = RPHelpers.findString("TITLE_CLIENT")
        self.showBackSpecialButon()
        self.navigationController?.isNavigationBarHidden = false
    }
    
    private func setupTableView() {
        let nibName = UINib(nibName: "ClientTableCell", bundle:nil)
        self.clientTable.register(nibName, forCellReuseIdentifier: "ClientCell")
    }
    
    //MARK: - TableViewDelegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.clientTable.dequeueReusableCell(withIdentifier: "ClientCell", for: indexPath) as! RPClientTableViewCell
        
        cell.cardView.layer.borderColor = UIColor.clear.cgColor
        cell.cardView.layer.borderWidth = 1.0
        cell.cardView.layer.cornerRadius = 8.0
        
        cell.cardView.layer.shadowColor = UIColor.black.cgColor
        cell.cardView.layer.shadowOpacity = 0.5
        cell.cardView.layer.shadowOffset = CGSize.init(width: 0.0, height: 7.0)
        cell.cardView.layer.masksToBounds = false
        cell.cardView.layer.shadowRadius = 4
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {

        let delete = UITableViewRowAction(style: .destructive, title: "Eliminar") { (action, indexPath) in
            // delete item at indexPath
        }
        
        let edit = UITableViewRowAction(style: .default, title: "Editar") { (action, indexPath) in
            // share item at indexPath
        }
        
        edit.backgroundColor = UIColor.lightGray
        
        return [delete, edit]
    }
    
    //MARK: - TextFieldDelegate
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
        self.customPickerContainer.isHidden = false
        self.customPickerContainer.addSubview(customPickerView.view)
        customPickerView.showPickerView()
    }

}

extension RPClientViewController: CustomPickerDelegate {
    
    func confirmPressed(itemSelected: String) {
        cityTextField.text = itemSelected
    }
    
    func closePressed() {
        customPickerContainer.isHidden = true
    }

}
