//
//  UICollectionViewCell+Extension.swift
//  POPExample
//
//  Created by Mesut Canbaz on 23.03.2022.
//

import Foundation
import UIKit

extension UICollectionViewCell: Reuse {
    /// to get UICollectionViewCell's string Identifier
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
