//
//  RPExtensions.swift
//  ReparaPC
//
//  Created by Javier Cervantes on 07/02/18.
//  Copyright © 2018 Oscod. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

class RPLabel : UILabel {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateFont()
    }
    
    var typeColor = 0 {
        didSet {
            switch typeColor {
            case 1:
                textColor = RPConstants.RPTheme.Colors.textColor
            case 2:
                textColor = RPSingleton.configuration.theme.primaryColor
            case 3:
                textColor = RPSingleton.configuration.theme.secondaryColor
            default:
                textColor = UIColor.black
            }
        }
    }
    
    var isBold = false {
        didSet {
            updateFont()
        }
    }
    var isTitle = false {
        didSet {
            updateFont()
        }
    }
    
    var isUnderLine = false {
        didSet {
            underlineText()
        }
    }
    
    func updateFont() {
        if isBold {
            self.font = UIFont(name: RPSingleton.configuration.theme.fontTextBold , size: font.pointSize)
        }
        else if isTitle {
            self.font = UIFont(name: RPSingleton.configuration.theme.fontTextTitle , size: 25)
        }
        else {
            self.font = UIFont(name: RPSingleton.configuration.theme.fontText , size: font.pointSize)
        }
    }
    
    func underlineText() {
        guard let finalText = text else {
            return
        }
        
        let attrStr = NSMutableAttributedString(string: finalText)
        attrStr.addAttributes([ NSAttributedStringKey.underlineStyle : NSUnderlineStyle.styleSingle.rawValue ], range: NSMakeRange(0, attrStr.length))
        attributedText = attrStr
        
        updateFont()
    }
}


class RPButton : UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func updateFont(updatedText: String! = nil) {
        if let titleLabel = titleLabel {
            titleLabel.font = UIFont(name: RPSingleton.configuration.theme.fontTextBold , size: titleLabel.font.pointSize)
            setTitleColor(UIColor.white, for: .normal)
            layer.masksToBounds = true
            layer.cornerRadius = 15.0
        }
    }
    
    var typeColor = 0 {
        didSet {
            switch typeColor {
            case 1:
                updateFont()
                backgroundColor = RPSingleton.configuration.theme.primaryColor
            case 2:
                updateFont()
                backgroundColor = RPSingleton.configuration.theme.secondaryColor
            case 3:
                updateFont()
                backgroundColor = RPSingleton.configuration.theme.disableColor
            case 4:
                updateFont()
                backgroundColor = RPSingleton.configuration.theme.cancelColor
            default:
                backgroundColor = self.backgroundColor
            }
        }
    }
    
    var isWithShadow = false {
        didSet {
            layer.cornerRadius = 2
            layer.shadowColor = UIColor.gray.cgColor
            layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
            layer.shadowOpacity = 0.5
            layer.shadowRadius = 4.0
            layer.masksToBounds = false
            layer.shadowRadius = 0.0
        }
    }
    
    var isUnderLine = false {
        didSet {
            
            let attrStr = NSMutableAttributedString(string: (titleLabel?.text)!)
            attrStr.addAttributes([ NSAttributedStringKey.underlineStyle : NSUnderlineStyle.styleSingle.rawValue ], range: NSMakeRange(0, attrStr.length))
            titleLabel?.attributedText = attrStr
            titleLabel?.font = UIFont(name: RPSingleton.configuration.theme.fontText , size: (titleLabel?.font.pointSize)!)
            setTitleColor(RPSingleton.configuration.theme.secondaryColor, for: .normal)
            
            
        }
    }
}

class RPRenderImageView : UIImageView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    var typeColor = 0 {
        didSet {
            image = self.image!.withRenderingMode(.alwaysTemplate)
            
            switch typeColor {
            case 1:
                self.tintColor = RPSingleton.configuration.theme.primaryColor
            case 2:
                self.tintColor = RPSingleton.configuration.theme.secondaryColor
            default:
                break
            }
        }
    }
}

class RPTextView : UITextView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if #available(iOS 10, *) {
            self.font = UIFont(name: RPSingleton.configuration.theme.fontText, size: font!.pointSize)
        }
        self.backgroundColor = UIColor.clear
    }
    
    var typeColor = 0 {
        didSet {
            switch typeColor {
            case 1:
                textColor = RPSingleton.configuration.theme.primaryColor
            case 2:
                textColor = RPSingleton.configuration.theme.secondaryColor
            default:
                textColor = UIColor.black
            }
        }
    }
}

class RPTextField : UITextField {
    
    required init(coder aDecoder:NSCoder) {
        super.init(coder:aDecoder)!
        setup()
    }
    
    override init(frame:CGRect) {
        super.init(frame:frame)
        setup()
    }
    
    private func setup() {
        font = UIFont(name: RPSingleton.configuration.theme.fontText, size: font!.pointSize)
        borderStyle = .none
        autocapitalizationType = .none
        autocorrectionType = .no
        spellCheckingType = .no
        textColor = RPSingleton.configuration.theme.textFieldsColor
    }
}
