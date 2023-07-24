//
//  UIView+Ext.swift
//  GHFollowers
//
//  Created by Tanya on 15.01.2023.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        for view in views { addSubview(view) }
    }
}
