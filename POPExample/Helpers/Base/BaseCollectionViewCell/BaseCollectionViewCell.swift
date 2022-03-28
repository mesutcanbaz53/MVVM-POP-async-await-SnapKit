//
//  BaseCollectionViewCell.swift
//  POPExample
//
//  Created by Mesut Canbaz on 23.03.2022.
//

import UIKit
 
class BaseCollectionViewCell: UICollectionViewCell, BaseViewProtocol {
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpViews()
        setUpConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setUpViews()
        setUpConstraints()
    }
    
    func setUpViews() {
        
    }
    
    func setUpConstraints() {
        
    }
}
