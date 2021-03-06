//
//  TMenuBar.swift
//  ReparaPC
//
//  Created by Javier Cervantes on 31/07/18.
//  Copyright © 2018 Oscod. All rights reserved.
//

import UIKit

class RPMenuBar: UIView , UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var horizontalBarLeftAnchorConstraint : NSLayoutConstraint?
    var horizontalBarView : UIView?
    var baseViewController : RPBaseViewController?
    
    lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor =  UIColor.returnRGBColor(r: 0, g: 0, b: 0, alpha: 1)
        cv.isScrollEnabled = false
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    let cellId = "cellId"
    let imageNames = ["icn-busqueda", "icn-mas"]
    let labelNames = ["Registros", "Añadir"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        collectionView.register(RPMenuCell.self, forCellWithReuseIdentifier: cellId)
        addSubview(collectionView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: collectionView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: collectionView)
        setupHorizontalBar()
    }
    
    func setupHorizontalBar() {
        horizontalBarView = UIView()
        horizontalBarView?.backgroundColor = UIColor.returnRGBColor(r: 255, g: 255, b: 255, alpha: 0.70)
        horizontalBarView?.translatesAutoresizingMaskIntoConstraints = false
        addSubview(horizontalBarView!)
        
        horizontalBarLeftAnchorConstraint = horizontalBarView?.leftAnchor.constraint(equalTo: self.leftAnchor)
        horizontalBarLeftAnchorConstraint?.isActive = true
        horizontalBarView?.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        horizontalBarView?.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/2).isActive = true
        horizontalBarView?.heightAnchor.constraint(equalToConstant: 4).isActive = true
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let x = CGFloat(indexPath.item) * frame.width / 2
        horizontalBarLeftAnchorConstraint?.constant = x
        switch indexPath.item {
        case 0:
            horizontalBarView?.backgroundColor = UIColor.returnRGBColor(r: 255, g: 255, b: 255, alpha: 0.70)
        case 1:
            horizontalBarView?.backgroundColor = UIColor.returnRGBColor(r: 255, g: 255, b: 255, alpha: 0.70)
        default:
            break
        }
        UIView.animate(withDuration: 0.70, delay: 0, options: .curveEaseOut, animations: {
            self.layoutIfNeeded()
        }, completion: nil)
        
        baseViewController?.goToSection(menuIndex: indexPath.item)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellM = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! RPMenuCell
        cellM.position = indexPath.row
        cellM.imageView.image = UIImage(named: imageNames[indexPath.item])?.withRenderingMode(.alwaysTemplate)
        cellM.labelText.text = labelNames[indexPath.item]
        collectionView.selectItem(at: IndexPath(item:0, section:0), animated: false, scrollPosition:[])
        cellM.labelText.textColor = UIColor.white
        cellM.imageView.tintColor = UIColor.white
        return cellM
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return Utility.shared.cGSizeMake(frame.width/2, frame.height)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func isHiddenMenu(isHiddenMenu : Bool) {
        self.isHidden = isHiddenMenu
    }

}


