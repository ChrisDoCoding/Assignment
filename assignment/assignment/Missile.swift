//
//  missile.swift
//  assignment
//
//  Created by Chris Chen on 2019/3/19.
//  Copyright © 2019 Dev4App. All rights reserved.
//

import UIKit

enum MissileType {
    case missileType_1
    case missileType_2
    case missileType_3
}

protocol Missile {
    var image: UIImage { get }
    var speed: Double { get }
    var size: CGSize { get }
    var costs: Int { get }
}

struct MissileType_1: Missile {
    
    var image: UIImage = UIImage(named: "missile1")!
    var speed: Double = 2.5
    var size: CGSize = CGSize(width: 20, height: 30)
    var costs: Int = 1
}

struct MissileType_2: Missile {
    
    var image: UIImage = UIImage(named: "missile2")!
    var speed: Double = 4.0
    var size: CGSize = CGSize(width: 30, height: 30)
    var costs: Int = 2
}

struct MissileType_3: Missile {
    
    var image: UIImage = UIImage(named: "missile3")!
    var speed: Double = 5.5
    var size: CGSize = CGSize(width: 40, height: 40)
    var costs: Int = 3
}
