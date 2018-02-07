//
//  RPSingleton.swift
//  ReparaPC
//
//  Created by Javier Cervantes on 07/02/18.
//  Copyright © 2018 Oscod. All rights reserved.
//

import UIKit

class RPSingleton: NSObject {
    
    static let configuration = RPSingleton()
    var theme = RPThemeManager()
    var menuBar = RPMenuBar()
    var optionBar = RPOptionBar()

}
