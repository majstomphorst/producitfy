//
//  DesignableConformationView.swift
//  producitfy
//
//  Created by Maxim Stomphorst on 07/06/2017.
//  Copyright © 2017 M.a.j©. All rights reserved.
//

import UIKit

@IBDesignable  class DesignableConformationView: UIView {

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }

}
