//
//  RPConstants.swift
//  ReparaPC
//
//  Created by Javier Cervantes on 07/02/18.
//  Copyright © 2018 Oscod. All rights reserved.
//

import UIKit

class RPConstants: NSObject {
    
    //MARK: - UI Configurations
    
    struct RPTheme {
        
        struct Colors {
            static let primaryColor = UIColor.color(fromHexString: "#004481")//navy blue
            static let secondaryColor = UIColor.color(fromHexString: "#E5E8EB")//light gray
            static let tertiaryColor = UIColor.color(fromHexString: "#F4F4F4")//lighter gray
            static let quaternaryColor = UIColor.color(fromHexString: "#F8F8F9")//Rate bgColor
            
            static let textFieldsColor = UIColor(red: 95.0/255.0, green: 96.0/255.0, blue: 98.0/255.0, alpha: 1)
            static let textColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1)
            static let disableColor = UIColor(red: 156.0/255.0, green: 164.0/255.0, blue: 164.0/255.0, alpha: 1)
            static let cancelColor = UIColor(red: 252.0/255.0, green: 24.0/255.0, blue: 35.0/255.0, alpha: 1)
            static let primaryBackgroundColor = UIColor(red: 222.0/255.0, green: 223.0/255.0, blue: 224.0/255.0, alpha: 1)
            static let secondaryBackgroundColor = UIColor.white
            static let tertiaryBackgroundColor = UIColor(red: 230.0/255.0, green: 231.0/255.0, blue: 232.0/255.0, alpha: 1)
            static let subViewBackGroudColor = UIColor(red: 249.0/255.0, green: 251.0/255.0, blue: 252.0/255.0, alpha: 1)
        }
        struct Fonts {
            static let fontText = "DIN-Regular"
            static let fontTextBold = "DIN-BoldAlternate"
            static let fontTitleText = "FSJoey-Bold"
        }
        
        struct Configutation {
            static let cve = "530"
        }
    }
    
    //MARK: - Server Config
    
    struct RPServerConfig {
        #if SIM
        static let url = RPHelpers.findString("url_SIM")
        #elseif AU
        static let url = RPHelpers.findString("url_AU")
        #else
        static let url = RPHelpers.findString("url_DEV")
        #endif
    }
    
    struct CodeResponse {
        static let code200 = "200"
        
    }
    struct CodeRide {
        static let codeC = "Corporativo"
        static let codeI = "Intersedes"
        static let codeS = "Espontaneo"
    }
    
    struct CreateURL {
        var urlString = ""
        
        init(requestName:String) {
            urlString = String.init(format: "%@%@", RPServerConfig.url , requestName)
        }
    }
    
    //MARK: - Various
    enum RPType{
        case RPTheme
    }

}
