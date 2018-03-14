//
//  Extensions.swift
//  Transporte
//
//  Created by Javier Cervantes on 13/11/17.
//  Copyright © 2017 IDS Comercial. All rights reserved.
//

import UIKit

fileprivate var ActivityIndicatorViewAssociativeKey = "ActivityIndicatorViewAssociativeKey"

extension UIColor{
    static func returnRGBColor(r:CGFloat, g:CGFloat, b:CGFloat, alpha:CGFloat) -> UIColor{
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: alpha)
    }
    
    
    static func color(fromHexString: String, alpha:CGFloat? = 1.0) -> UIColor {
        // Convert hex string to an integer
        let hexint = Int(colorInteger(fromHexString: fromHexString))
        let red = CGFloat((hexint & 0xff0000) >> 16) / 255.0
        let green = CGFloat((hexint & 0xff00) >> 8) / 255.0
        let blue = CGFloat((hexint & 0xff) >> 0) / 255.0
        let alpha = alpha!
        
        // Create color object, specifying alpha as well
        let color = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        return color
    }
    
    private static func colorInteger(fromHexString: String) -> UInt32 {
        var hexInt: UInt32 = 0
        // Create scanner
        let scanner: Scanner = Scanner(string: fromHexString)
        // Tell scanner to skip the # character
        scanner.charactersToBeSkipped = CharacterSet(charactersIn: "#")
        // Scan hex value
        scanner.scanHexInt32(&hexInt)
        return hexInt
    }
    
    var redValue: CGFloat{
        return cgColor.components! [0]
    }
    
    var greenValue: CGFloat{
        return cgColor.components! [1]
    }
    
    var blueValue: CGFloat{
        return cgColor.components! [2]
    }
    
    var alphaValue: CGFloat{
        return cgColor.components! [3]
    }
}

extension UIView {
    
    func addBorderColor(){
        self.layer.borderColor = UIColor.darkGray.cgColor
        self.layer.borderWidth = 3.0
        self.layer.cornerRadius = 10.0
    }
    
    func addConstraintsWithFormat(format:String, views: UIView...){
        
        var viewsDictionary = [String:UIView]()
        for (index, view) in views.enumerated(){
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
            
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
    
    var activityIndicatorView: UIActivityIndicatorView {
        get {
            if let activityIndicator = getAssociatedObject(&ActivityIndicatorViewAssociativeKey) as? UIActivityIndicatorView {
                return activityIndicator
            } else {
                let activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
                let transform : CGAffineTransform = CGAffineTransform(scaleX: 4, y: 4)
                activityIndicator.transform = transform
                activityIndicator.activityIndicatorViewStyle = .gray
                activityIndicator.color = .gray
                activityIndicator.center = center
                activityIndicator.hidesWhenStopped = true
                addSubview(activityIndicator)
                
                setAssociatedObject(activityIndicator, associativeKey: &ActivityIndicatorViewAssociativeKey, policy: .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                return activityIndicator
            }
        }
        
        set {
            addSubview(newValue)
            setAssociatedObject(newValue, associativeKey:&ActivityIndicatorViewAssociativeKey, policy: .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    var activityTableIndicatorView: UIActivityIndicatorView {
        get {
            if let activityTableIndicator = getAssociatedObject(&ActivityIndicatorViewAssociativeKey) as? UIActivityIndicatorView {
                self.isUserInteractionEnabled = true
                return activityTableIndicator
            } else {
                let activityTableIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
                let transform : CGAffineTransform = CGAffineTransform(scaleX: 4, y: 4)
                activityTableIndicator.transform = transform
                activityTableIndicator.activityIndicatorViewStyle = .gray
                activityTableIndicator.color = .gray
                activityTableIndicator.center = center
                activityTableIndicator.hidesWhenStopped = true
                addSubview(activityTableIndicator)
                
                self.isUserInteractionEnabled = false
                setAssociatedObject(activityTableIndicator, associativeKey: &ActivityIndicatorViewAssociativeKey, policy: .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                return activityTableIndicator
            }
        }
        
        set {
            addSubview(newValue)
            setAssociatedObject(newValue, associativeKey:&ActivityIndicatorViewAssociativeKey, policy: .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
}

extension UIActivityIndicatorView
{
    func starActivityIndicator(){
        UIApplication.shared.beginIgnoringInteractionEvents()
        self.startAnimating()
    }
    
    func stopActivityIndicator(){
        UIApplication.shared.endIgnoringInteractionEvents()
        self.stopAnimating()
    }
}

extension NSObject {
    func setAssociatedObject(_ value: AnyObject?, associativeKey: UnsafeRawPointer, policy: objc_AssociationPolicy) {
        if let valueAsAnyObject = value {
            objc_setAssociatedObject(self, associativeKey, valueAsAnyObject, policy)
        }
    }
    
    func getAssociatedObject(_ associativeKey: UnsafeRawPointer) -> Any? {
        guard let valueAsType = objc_getAssociatedObject(self, associativeKey) else {
            return nil
        }
        return valueAsType
    }
}

extension UIActivityType{
    static func excludedActivities() -> [UIActivityType] {
        return [UIActivityType.airDrop, UIActivityType.addToReadingList]
        
    }
}

extension String {
    
    func contains(find: String) -> Bool{
        return self.range(of: find) != nil
    }
    
    func containsIgnoringCase(find: String) -> Bool{
        return self.range(of: find, options: NSString.CompareOptions.caseInsensitive) != nil
    }
}


extension Date {
    func getLast6Month() -> Date? {
        return Calendar.current.date(byAdding: .month, value: -6, to: self)
    }
    
    func getLast3Month() -> Date? {
        return Calendar.current.date(byAdding: .month, value: -3, to: self)
    }
    
    func getYesterday() -> Date? {
        return Calendar.current.date(byAdding: .day, value: -1, to: self)
    }
    
    func getLast7Day() -> Date? {
        return Calendar.current.date(byAdding: .day, value: -7, to: self)
    }
    
    func getLast30Day() -> Date? {
        return Calendar.current.date(byAdding: .day, value: -30, to: self)
    }
    
    func getNext30Day() -> Date? {
        return Calendar.current.date(byAdding: .day, value: 30, to: self)
    }
    
    func getPreviousMonth() -> Date? {
        return Calendar.current.date(byAdding: .month, value: -1, to: self)
    }
    
    // This Month Start
    func getThisMonthStart() -> Date? {
        let components = Calendar.current.dateComponents([.year, .month], from: self)
        return Calendar.current.date(from: components)!
    }
    
    func getThisMonthEnd() -> Date? {
        let components:NSDateComponents = Calendar.current.dateComponents([.year, .month], from: self) as NSDateComponents
        components.month += 1
        components.day = 1
        components.day -= 1
        return Calendar.current.date(from: components as DateComponents)!
    }
    
    //Last Month Start
    func getLastMonthStart() -> Date? {
        let components:NSDateComponents = Calendar.current.dateComponents([.year, .month], from: self) as NSDateComponents
        components.month -= 1
        return Calendar.current.date(from: components as DateComponents)!
    }
    
    //Last Month End
    func getLastMonthEnd() -> Date? {
        let components:NSDateComponents = Calendar.current.dateComponents([.year, .month], from: self) as NSDateComponents
        components.day = 1
        components.day -= 1
        return Calendar.current.date(from: components as DateComponents)!
    }
    
}

extension UIDevice {
    
    var modelName: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        switch identifier {
        case "iPod5,1":                                 return "iPod Touch 5"
        case "iPod7,1":                                 return "iPod Touch 6"
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":     return "iPhone 4"
        case "iPhone4,1":                               return "iPhone 4s"
        case "iPhone5,1", "iPhone5,2":                  return "iPhone 5"
        case "iPhone5,3", "iPhone5,4":                  return "iPhone 5c"
        case "iPhone6,1", "iPhone6,2":                  return "iPhone 5s"
        case "iPhone7,2":                               return "iPhone 6"
        case "iPhone7,1":                               return "iPhone 6 Plus"
        case "iPhone8,1":                               return "iPhone 6s"
        case "iPhone8,2":                               return "iPhone 6s Plus"
        case "iPhone9,1", "iPhone9,3":                  return "iPhone 7"
        case "iPhone9,2", "iPhone9,4":                  return "iPhone 7 Plus"
        case "iPhone8,4":                               return "iPhone SE"
        case "iPhone10,1", "iPhone10,4":                return "iPhone 8"
        case "iPhone10,2", "iPhone10,5":                return "iPhone 8 Plus"
        case "iPhone10,3", "iPhone10,6":                return "iPhone X"
        default:                                        return identifier
        }
    }
    
}

