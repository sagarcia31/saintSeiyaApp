//
//  imageExtension.swift
//  tableViewExample
//
//  Created by Marcelo Garcia on 17/02/22.
//

import UIKit

extension UIImageView {
    func roundImage() {
        layer.borderWidth = 1.0
        layer.masksToBounds = false
        layer.borderColor = UIColor.white.cgColor
        layer.cornerRadius = self.frame.size.width / 2
        clipsToBounds = true
    }
}
