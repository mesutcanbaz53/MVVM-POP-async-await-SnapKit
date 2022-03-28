//
//  UIImageView+Extension.swift
//  POPExample
//
//  Created by Mesut Canbaz on 23.03.2022.
//

import UIKit
import Kingfisher

extension UIImageView {
    /// use for url image with Kingfisher
    func setImage(urlString: String) {
        let url = URL(string: urlString)
        self.kf.setImage(with: url)
    }
}
