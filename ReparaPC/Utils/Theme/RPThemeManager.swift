//
//  RPThemeManager.swift
//  ReparaPC
//
//  Created by Javier Cervantes on 07/02/18.
//  Copyright © 2018 Oscod. All rights reserved.
//

import UIKit

class RPThemeManager {
    
    var primaryColor = UIColor.black
    var secondaryColor = UIColor.black
    var tertiaryColor = UIColor.black
    var quaternaryColor = UIColor.black
    var primaryBackgroundColor = UIColor.gray
    var secondaryBackgroundColor = UIColor.white
    var tertiaryBackgroundColor = UIColor.white
    var textColor = UIColor.black
    var disableColor = UIColor.gray
    var cancelColor = UIColor.red
    var subViewBackGroudColor = UIColor.gray
    var fontText = ""
    var fontTextBold = ""
    var fontTextTitle = ""
    var textFieldsColor = UIColor.black
    var backgroundColorT = UIColor.white
    var secondaryBackgroundColorT = UIColor.white
    
    init(){
        // Intentionally unimplemented...
    }
    
    init(brand:RPConstants.RPType) {
        switch brand {
            
        case .RPTheme:
            primaryColor = RPConstants.RPTheme.Colors.primaryColor
            secondaryColor = RPConstants.RPTheme.Colors.secondaryColor
            tertiaryColor = RPConstants.RPTheme.Colors.tertiaryColor
            quaternaryColor = RPConstants.RPTheme.Colors.quaternaryColor
            textFieldsColor = RPConstants.RPTheme.Colors.textFieldsColor
            primaryBackgroundColor = RPConstants.RPTheme.Colors.primaryBackgroundColor
            secondaryBackgroundColor = RPConstants.RPTheme.Colors.secondaryBackgroundColor
            tertiaryBackgroundColor = RPConstants.RPTheme.Colors.tertiaryBackgroundColor
            textColor = RPConstants.RPTheme.Colors.textColor
            disableColor = RPConstants.RPTheme.Colors.disableColor
            cancelColor = RPConstants.RPTheme.Colors.cancelColor
            subViewBackGroudColor = RPConstants.RPTheme.Colors.subViewBackGroudColor
            fontText = RPConstants.RPTheme.Fonts.fontText
            fontTextBold = RPConstants.RPTheme.Fonts.fontTextBold
            fontTextTitle = RPConstants.RPTheme.Fonts.fontTitleText
        }
    }
}


