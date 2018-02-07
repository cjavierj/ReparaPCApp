//
//  RPHelpers.swift
//  
//
//  Created by Javier Cervantes on 07/02/18.
//

import UIKit

class RPHelpers: NSObject {
    
    internal static func findString(_ stringKey : String) -> String {
        return NSLocalizedString(stringKey, comment: "String not found")
    }
}
