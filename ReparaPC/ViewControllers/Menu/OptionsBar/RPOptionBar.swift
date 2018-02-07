//
//  TOptionBar.swift
//  Transporte
//
//  Created by Javier Cervantes on 13/11/17.
//  Copyright © 2017 IDS Comercial. All rights reserved.
//

import UIKit

class RPOptionBar : UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
{
    
    var horizontalBarLeftAnchorConstraint : NSLayoutConstraint?
    var horizontalBarView : UIView?
    var baseViewController : RPBaseViewController?
    
    lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = UIColor.color(fromHexString: "#F4F4F4")
        cv.isScrollEnabled = false
        
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    let cellId = "cellId"
    let labelNames = ["TRANSPORTE INTERSEDES", "VIAJERO ESPONTÁNEO","TRANSPORTE CORPORATIVO"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        collectionView.register(RPOptionCell.self, forCellWithReuseIdentifier: cellId)
        addSubview(collectionView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: collectionView)
        let model = UIDevice()
        if model.modelName == "iPhone X"{
            addConstraintsWithFormat(format: "V:|-10-[v0]|", views: collectionView)
        }else{
            addConstraintsWithFormat(format: "V:|-0-[v0]|", views: collectionView)
        }
        setupHorizontalBar()
    }
    
    func setupHorizontalBar(){
        horizontalBarView = UIView()
        horizontalBarView?.backgroundColor = UIColor.color(fromHexString: "#2dcccd")
        horizontalBarView?.translatesAutoresizingMaskIntoConstraints = false
        addSubview(horizontalBarView!)
        
        horizontalBarLeftAnchorConstraint = horizontalBarView?.leftAnchor.constraint(equalTo: self.leftAnchor)
        horizontalBarLeftAnchorConstraint?.isActive = true
        horizontalBarView?.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        horizontalBarView?.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/3).isActive = true
        horizontalBarView?.heightAnchor.constraint(equalToConstant: 4).isActive = true
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let x = CGFloat(indexPath.item) * frame.width / 3
        horizontalBarLeftAnchorConstraint?.constant = x
        horizontalBarView?.backgroundColor = UIColor.color(fromHexString: "#2dcccd")
        UIView.animate(withDuration: 0.70, delay: 0, options: .curveEaseOut, animations: {
            self.layoutIfNeeded()
        }, completion: nil)
        
        baseViewController?.goToOption(menuIndex: indexPath.item)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! RPOptionCell
        cell.position = indexPath.row
        cell.labelText.text = labelNames[indexPath.item]
        collectionView.selectItem(at: IndexPath(item:0, section:0), animated: false, scrollPosition:[])
        cell.labelText.textColor = UIColor.color(fromHexString: "#004481")
        cell.labelText.textAlignment = .center
        cell.labelText.adjustsFontSizeToFitWidth = true
        cell.labelText.numberOfLines = 2
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return Utility.shared.cGSizeMake(frame.width/3, frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func isHiddenMenu(isHiddenMenu : Bool)
    {
        self.isHidden = isHiddenMenu
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

