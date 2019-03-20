//
//  ThemeManager.swift
//  assignment
//
//  Created by Chris Chen on 2019/3/20.
//  Copyright © 2019 Dev4App. All rights reserved.
//

import UIKit

class MissileTypeButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupImage(withImageString imageString: String) {
        if let image = UIImage(named: imageString) {
            self.setImage(image, for: .normal)
        }
    }
}
