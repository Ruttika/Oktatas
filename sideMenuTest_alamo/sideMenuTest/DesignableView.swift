//
//  DesignableView.swift
//  sideMenuTest
//
//  Created by Rudolf Dani on 2018. 12. 09..
//  Copyright © 2018. Rudolf Dani. All rights reserved.
//

import UIKit

@IBDesignable class DesignableView: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
}
