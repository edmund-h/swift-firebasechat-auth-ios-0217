//
//  viewFormatters.swift
//  Firechat
//
//  Created by Edmund Holderbaum on 3/23/17.
//  Copyright © 2017 Johann Kerr. All rights reserved.
//

import Foundation
import UIKit

final class viewFormatter{
    
    static func formatButton (_ button: UIButton) {
        button.layer.cornerRadius = 9
        button.backgroundColor = UIColor.white
        button.setTitleColor( UIColor.firebaseOrange, for: .normal)
    }
    
    static func formatLabel (_ label: UILabel) {
        label.alpha = 0
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
    }

}
