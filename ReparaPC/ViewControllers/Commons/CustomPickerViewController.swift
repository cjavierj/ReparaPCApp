//
//  CustomPickerViewController.swift
//  ReparaPC
//
//  Created by Javier Cervantes on 25/07/18.
//  Copyright © 2018 Oscod. All rights reserved.
//

import UIKit

protocol CustomPickerDelegate {
    
    func confirmPressed(itemSelected: String)
    func closePressed()
    
}

class CustomPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var customPickerView: UIPickerView!
    @IBOutlet weak var customPickerBarView: UIView!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    var pickerData = ["SHY", "JQL", "SP"]
    var pickerSelected = ""
    var delegate: CustomPickerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    //MARK: - Actions
    @IBAction func confirmAction(_ sender: Any) {
        hidePickerView()
        delegate?.confirmPressed(itemSelected: pickerSelected)
    }
    
    @IBAction func closeAction(_ sender: Any) {
        hidePickerView()
    }
    //MARK: - Show/Hide pickerView
    func showPickerView() {
        UIView.animate(withDuration: 0.70, delay: 0, options: .curveEaseOut, animations: {
            self.bottomConstraint.constant = 0
            self.customPickerView.isHidden = false
            self.customPickerBarView.isHidden = false
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    private func hidePickerView() {
        UIView.animate(withDuration: 0.70, delay: 0, options: .curveEaseOut, animations: {
            self.bottomConstraint.constant = 400
            self.view.layoutIfNeeded()
        }, completion: { (finished: Bool) in
            self.customPickerView.isHidden = true
            self.customPickerBarView.isHidden = true
            self.delegate?.closePressed()
        })
    }
    
    //MARK: - PickerViewDelegate
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerSelected = pickerData[row]
    }


}
