//
//  Utility.swift
//  Transporte
//
//  Created by Javier Cervantes on 13/11/17.
//  Copyright © 2017 IDS Comercial. All rights reserved.
//

import UIKit
import MapKit
import Foundation

final class Utility: NSObject {
    private override init() {
        //singleton constructor
    }
    static let shared = Utility()
    
    
    func cGRectMake(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
        return CGRect(x: x, y: y, width: width, height: height)
    }
    
    func cGSizeMake( _ width:CGFloat, _ height:CGFloat) -> CGSize{
        return CGSize(width: width, height: height)
    }
    
    func attributedText(withString string: String, boldString: String, font: UIFont) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: string,
                                                         attributes: [NSAttributedStringKey.font: font])
        let boldFontAttribute: [NSAttributedStringKey: Any] = [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: font.pointSize)]
        let range = (string as NSString).range(of: boldString)
        attributedString.addAttributes(boldFontAttribute, range: range)
        return attributedString
    }
    
    func deleteDEToDate(date: String) -> String{
        let substring = date.split(sep: " de")
        return substring[0]+substring[1]+substring[2]
    }
    
    
    
}

extension String {
    public func split(sep: String) -> [String] {
        if var pre = self.range(of: sep) {
            var parts = [self.substring(to:pre.lowerBound)]
            while let rng = self.range(of: sep, range: pre.upperBound..<endIndex) {
                parts.append(self.substring(with: pre.upperBound..<rng.lowerBound))
                pre = rng
            }
            parts.append(self.substring(with: pre.upperBound..<endIndex))
            return parts
        } else {
            return [self]
        }
    }
}


class ColorPointAnnotation: MKPointAnnotation {
    var pinColor: UIColor
    
    init(pinColor: UIColor) {
        self.pinColor = pinColor
        super.init()
    }
}

